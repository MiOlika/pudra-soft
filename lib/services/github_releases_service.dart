import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/app_release.dart';

/// Загружает релизы приложений издателя через публичный API GitHub.
///
/// Без авторизации GitHub разрешает 60 запросов в час с одного IP, поэтому
/// каждый репозиторий запрашивается один раз за открытие сайта. Если запрос не
/// удался, сайт показывает версию и ссылку из [AppModel].
class GithubReleasesService {
  GithubReleasesService({http.Client? client})
      : _client = client ?? http.Client();

  static final GithubReleasesService instance = GithubReleasesService();

  static const String publisher = 'MiOlika';
  static const Duration _timeout = Duration(seconds: 15);

  final http.Client _client;
  final Map<String, Future<List<AppRelease>>> _requests = {};
  final Map<String, List<AppRelease>> _loaded = {};

  /// Уже загруженные релизы, чтобы при переключении приложений не было мигания.
  List<AppRelease>? loaded(String repo) => _loaded[repo];

  /// Релизы репозитория, новые первыми.
  Future<List<AppRelease>> releasesFor(String repo) {
    return _requests.putIfAbsent(repo, () => _fetch(repo));
  }

  Future<List<AppRelease>> _fetch(String repo) async {
    final uri = Uri.https(
      'api.github.com',
      '/repos/$publisher/$repo/releases',
      {'per_page': '100'},
    );
    final response = await _client.get(
      uri,
      headers: const {'Accept': 'application/vnd.github+json'},
    ).timeout(_timeout);

    if (response.statusCode != 200) {
      throw http.ClientException(
        'GitHub ответил ${response.statusCode} для $repo',
        uri,
      );
    }

    final releases = parseReleases(utf8.decode(response.bodyBytes));
    _loaded[repo] = releases;
    return releases;
  }

  /// Разбирает ответ GitHub: убирает черновики и сортирует от новых к старым.
  static List<AppRelease> parseReleases(String body) {
    final items = (jsonDecode(body) as List<dynamic>)
        .cast<Map<String, dynamic>>()
        .where((item) => item['draft'] != true);
    final releases = items.map(AppRelease.fromJson).toList()
      ..sort((a, b) {
        final left = a.publishedAt;
        final right = b.publishedAt;
        if (left == null || right == null) return 0;
        return right.compareTo(left);
      });
    return releases;
  }
}
