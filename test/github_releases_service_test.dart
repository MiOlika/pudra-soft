import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pudra_soft/l10n/generated/app_localizations.dart';
import 'package:pudra_soft/services/github_releases_service.dart';

void main() {
  const body = '''
[
  {"tag_name": "1.0.0.0", "draft": false, "prerelease": false,
   "published_at": "2026-01-01T10:00:00Z", "html_url": "https://x/1",
   "assets": [{"name": "App_1.0.0.0.msi", "size": 14336000,
               "browser_download_url": "https://x/1.msi"}]},
  {"tag_name": "v2.0.0.0", "draft": false, "prerelease": true,
   "published_at": "2026-03-01T10:00:00Z", "html_url": "https://x/2",
   "assets": [{"name": "checksums.txt", "size": 10,
               "browser_download_url": "https://x/sum"},
              {"name": "App.zip", "size": 20,
               "browser_download_url": "https://x/2.zip"},
              {"name": "App.exe", "size": 30,
               "browser_download_url": "https://x/2.exe"}]},
  {"tag_name": "3.0.0.0", "draft": true, "prerelease": false,
   "published_at": "2026-04-01T10:00:00Z", "html_url": "https://x/3",
   "assets": []}
]
''';

  test('убирает черновики и сортирует от новых к старым', () {
    final releases = GithubReleasesService.parseReleases(body);

    expect(releases.map((r) => r.version), ['2.0.0.0', '1.0.0.0']);
  });

  test('оставляет только установщики и выбирает основной', () {
    final release = GithubReleasesService.parseReleases(body).first;

    expect(release.assets.map((a) => a.name), ['App.exe', 'App.zip']);
    expect(release.downloadUrl, 'https://x/2.exe');
  });

  test('форматирует размер файла для каждого языка', () {
    final size =
        GithubReleasesService.parseReleases(body).last.primaryAsset!.sizeInMb;

    expect(lookupAppLocalizations(const Locale('ru')).fileSize(size), '13,7 МБ');
    expect(lookupAppLocalizations(const Locale('en')).fileSize(size), '13.7 MB');
  });

  test('без установщика ведёт на страницу релиза', () {
    final releases = GithubReleasesService.parseReleases(
      '[{"tag_name": "1.0", "html_url": "https://x/1", "assets": []}]',
    );

    expect(releases.single.downloadUrl, 'https://x/1');
  });
}
