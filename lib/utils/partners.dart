import 'package:pudra_soft/l10n/generated/app_localizations.dart';
import 'package:pudra_soft/models/partner.dart';

class Partners {
  static List<Partner> partnersFor(AppLocalizations l) => [
        Partner(
          name: l.partnerScanSoftName,
          logoFile: 'scan_soft_logo.png',
          websiteUrl: 'https://scan-soft.ru/',
          description: l.partnerScanSoftDescription,
        ),
      ];
}
