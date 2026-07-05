import 'package:flutter/material.dart';
import '../data/income_data.dart';
import '../theme/tax_colors.dart';
import '../widgets/income_list_row.dart';
import '../widgets/tax_nav_bar.dart';
import '../widgets/tax_summary_panel.dart';

class IncomeTaxPage extends StatelessWidget {
  const IncomeTaxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TaxColors.pageBg,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const TaxNavBar(),
            const TaxSummaryPanel(),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: incomeItems.length,
                itemBuilder: (context, index) {
                  return IncomeListRow(item: incomeItems[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
