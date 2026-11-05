import 'package:flutter/material.dart';

import '../l10n/generated/app_localizations.dart';
import '../utils/partners.dart';
import 'partner_card.dart';
import 'site_common.dart';

/// Раздел партнёров.
class PartnerSection extends StatelessWidget {
  const PartnerSection({super.key});

  @override
  Widget build(BuildContext context) {
    final strings = AppLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionTitle(eyebrow: strings.partnersEyebrow),
        ResponsiveGrid(
          children: [
            for (final partner in Partners.partnersFor(strings))
              PartnerCard(partner: partner),
          ],
        ),
      ],
    );
  }
}
