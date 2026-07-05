import 'package:flutter/material.dart';
import '../models/income_item.dart';
import '../theme/tax_colors.dart';
import '../theme/tax_dimens.dart';

class IncomeListRow extends StatelessWidget {
  final IncomeItem item;

  const IncomeListRow({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final s = TaxDimens.scale(context);
    final hasTitle = item.hasTitle;

    return Column(
      children: [
        Container(
          color: TaxColors.white,
          padding: EdgeInsets.fromLTRB(
            18 * s,
            hasTitle ? 23 * s : 15 * s,
            18 * s,
            hasTitle ? 21 * s : 19 * s,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (hasTitle) ...[
                      Row(
                        children: [
                          Text(
                            '工资薪金',
                            style: TextStyle(
                              color: TaxColors.mainText,
                              fontSize: 22.2 * s,
                              fontWeight: FontWeight.w500,
                              height: 1,
                              letterSpacing: -0.2 * s,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            item.month!,
                            style: TextStyle(
                              color: TaxColors.mainText,
                              fontSize: 22.0 * s,
                              fontWeight: FontWeight.w400,
                              height: 1,
                              letterSpacing: -0.1 * s,
                            ),
                          ),
                          SizedBox(width: 34 * s),
                        ],
                      ),
                      SizedBox(height: 16 * s),
                      _DetailText('所得项目小类： 正常工资薪金', scale: s),
                      SizedBox(height: 10 * s),
                    ],
                    _DetailText('扣缴义务人： 优视科技（中国）有限公...', scale: s),
                    SizedBox(height: 10 * s),
                    _DetailText('收入：  ${item.income}元', scale: s),
                    SizedBox(height: 10 * s),
                    _DetailText('已申报税额：  ${item.tax}元', scale: s),
                  ],
                ),
              ),
              SizedBox(width: 8 * s),
              Icon(
                Icons.arrow_forward_ios,
                color: TaxColors.arrow,
                size: 24 * s,
              ),
            ],
          ),
        ),
        Container(height: 14 * s, color: TaxColors.pageBg),
      ],
    );
  }
}

class _DetailText extends StatelessWidget {
  final String text;
  final double scale;

  const _DetailText(this.text, {required this.scale});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.clip,
      style: TextStyle(
        color: TaxColors.detailText,
        fontSize: 18.05 * scale,
        fontWeight: FontWeight.w400,
        height: 1.08,
        letterSpacing: 0,
      ),
    );
  }
}
