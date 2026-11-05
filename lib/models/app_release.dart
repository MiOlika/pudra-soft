/// Файл, приложенный к релизу на GitHub.
class ReleaseAsset {
  final String name;
  final int sizeBytes;
  final String downloadUrl;

  const ReleaseAsset({
    required this.name,
    required this.sizeBytes,
    required this.downloadUrl,
  });

  factory ReleaseAsset.fromJson(Map<String, dynamic> json) {
    return ReleaseAsset(
      name: json['name'] as String? ?? '',
      sizeBytes: json['size'] as int? ?? 0,
      downloadUrl: json['browser_download_url'] as String? ?? '',
    );
  }

  String get extension {
    final dot = name.lastIndexOf('.');
    return dot == -1 ? '' : name.substring(dot + 1).toLowerCase();
  }

  /// Размер в мегабайтах.
  double get sizeInMb => sizeBytes / (1024 * 1024);
}

/// Релиз приложения на GitHub.
class AppRelease {
  /// Форматы установщиков в порядке предпочтения. Остальные файлы релиза
  /// (контрольные суммы, служебные файлы обновления) на сайте не показываем.
  static const List<String> installerExtensions = ['msi', 'exe', 'msix', 'zip'];

  final String version;
  final DateTime? publishedAt;
  final String pageUrl;
  final bool isPrerelease;
  final List<ReleaseAsset> assets;

  const AppRelease({
    required this.version,
    required this.publishedAt,
    required this.pageUrl,
    required this.isPrerelease,
    required this.assets,
  });

  factory AppRelease.fromJson(Map<String, dynamic> json) {
    final rawAssets = json['assets'] as List<dynamic>? ?? const [];
    final installers = rawAssets
        .map((a) => ReleaseAsset.fromJson(a as Map<String, dynamic>))
        .where((a) => installerExtensions.contains(a.extension))
        .toList()
      ..sort((a, b) => installerExtensions
          .indexOf(a.extension)
          .compareTo(installerExtensions.indexOf(b.extension)));

    return AppRelease(
      version: (json['tag_name'] as String? ?? '').replaceFirst(
        RegExp(r'^v\.?', caseSensitive: false),
        '',
      ),
      publishedAt: DateTime.tryParse(json['published_at'] as String? ?? ''),
      pageUrl: json['html_url'] as String? ?? '',
      isPrerelease: json['prerelease'] as bool? ?? false,
      assets: installers,
    );
  }

  /// Основной установщик релиза, если он есть.
  ReleaseAsset? get primaryAsset => assets.isEmpty ? null : assets.first;

  /// Куда вести по кнопке скачивания: на файл или, если файла нет, на страницу.
  String get downloadUrl => primaryAsset?.downloadUrl ?? pageUrl;
}
