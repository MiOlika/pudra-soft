import 'package:flutter/material.dart';

import '../models/app_model.dart';
import '../models/app_release.dart';
import '../services/github_releases_service.dart';

/// Состояние загрузки релизов одного приложения.
class AppReleases {
  final AppModel app;
  final List<AppRelease> all;
  final bool isLoading;
  final bool hasError;

  const AppReleases({
    required this.app,
    required this.all,
    required this.isLoading,
    required this.hasError,
  });

  /// Последний стабильный релиз, а если таких нет, то самый новый.
  AppRelease? get latest {
    for (final release in all) {
      if (!release.isPrerelease) return release;
    }
    return all.isEmpty ? null : all.first;
  }

  /// Актуальная версия: с GitHub или запасная из [AppModel].
  String get version => latest?.version ?? app.version;

  /// Актуальная ссылка: с GitHub или запасная из [AppModel].
  String get downloadUrl => latest?.downloadUrl ?? app.downloadUrl;
}

/// Подставляет в [builder] релизы приложения с GitHub.
class AppReleasesBuilder extends StatelessWidget {
  final AppModel app;
  final Widget Function(BuildContext context, AppReleases releases) builder;

  const AppReleasesBuilder({
    super.key,
    required this.app,
    required this.builder,
  });

  @override
  Widget build(BuildContext context) {
    final service = GithubReleasesService.instance;

    return FutureBuilder<List<AppRelease>>(
      future: service.releasesFor(app.githubRepo),
      initialData: service.loaded(app.githubRepo),
      builder: (context, snapshot) {
        return builder(
          context,
          AppReleases(
            app: app,
            all: snapshot.data ?? const [],
            isLoading: !snapshot.hasData && !snapshot.hasError,
            hasError: snapshot.hasError,
          ),
        );
      },
    );
  }
}
