import 'package:flutter/material.dart';
import '../theme/tax_colors.dart';
import '../theme/tax_dimens.dart';

class TaxNavBar extends StatelessWidget {
  const TaxNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final s = TaxDimens.scale(context);
    return Container(
      height: 57 * s,
      decoration: const BoxDecoration(
        color: TaxColors.white,
        border: Border(bottom: BorderSide(color: TaxColors.hairline, width: 0.7)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 17 * s),
      child: Row(
        children: [
          SizedBox(
            width: 96 * s,
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: TaxColors.primaryBlue, size: 20 * s),
                SizedBox(width: 2 * s),
                Text('返回', style: TextStyle(color: TaxColors.primaryBlue, fontSize: 18.4 * s, fontWeight: FontWeight.w400, height: 1)),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text('收入纳税明细', style: TextStyle(color: TaxColors.mainText, fontSize: 20.4 * s, fontWeight: FontWeight.w400, height: 1)),
            ),
          ),
          SizedBox(
            width: 96 * s,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('批量申诉', style: TextStyle(color: TaxColors.primaryBlue, fontSize: 18.4 * s, fontWeight: FontWeight.w400, height: 1)),
            ),
          ),
        ],
      ),
    );
  }
}
