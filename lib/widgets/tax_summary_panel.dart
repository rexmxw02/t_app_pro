import 'package:flutter/material.dart';
import '../theme/tax_colors.dart';
import '../theme/tax_dimens.dart';

class TaxSummaryPanel extends StatelessWidget {
  const TaxSummaryPanel({super.key});

  @override
  Widget build(BuildContext context) {
    final s = TaxDimens.scale(context);

    return Column(
      children: [
        Container(height: 13 * s, color: TaxColors.pageBg),
        Container(
          color: TaxColors.white,
          padding: EdgeInsets.fromLTRB(18 * s, 25 * s, 18 * s, 20 * s),
          child: Column(
            children: [
              const _SummaryLine(
                label: '收入合计',
                value: '192975.94元',
                showHelp: true,
              ),
              SizedBox(height: 17 * s),
              Container(height: 0.7, color: TaxColors.hairline),
              SizedBox(height: 17 * s),
              const _SummaryLine(
                label: '已申报税额合计：',
                value: '9485.89元',
              ),
            ],
          ),
        ),
        Container(height: 14 * s, color: TaxColors.pageBg),
      ],
    );
  }
}

class _SummaryLine extends StatelessWidget {
  final String label;
  final String value;
  final bool showHelp;

  const _SummaryLine({
    required this.label,
    required this.value,
    this.showHelp = false,
  });

  @override
  Widget build(BuildContext context) {
    final s = TaxDimens.scale(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            color: TaxColors.mainText,
            fontSize: 19.2 * s,
            fontWeight: FontWeight.w500,
            height: 1,
            letterSpacing: -0.15 * s,
          ),
        ),
        if (showHelp) ...[
          SizedBox(width: 5 * s),
          Container(
            width: 20 * s,
            height: 20 * s,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: TaxColors.primaryBlue,
                width: 1.25 * s,
              ),
            ),
            child: Text(
              '?',
              style: TextStyle(
                color: TaxColors.primaryBlue,
                fontSize: 15 * s,
                fontWeight: FontWeight.w300,
                height: 1,
              ),
            ),
          ),
          Text(
            '：',
            style: TextStyle(
              color: TaxColors.mainText,
              fontSize: 19.2 * s,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
        ],
        const Spacer(),
        Text(
          value,
          style: TextStyle(
            color: TaxColors.mainText,
            fontSize: 18.2 * s,
            fontWeight: FontWeight.w500,
            height: 1,
            letterSpacing: -0.1 * s,
          ),
        ),
      ],
    );
  }
}
