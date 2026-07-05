import 'package:flutter/material.dart';
import '../models/income_record.dart';

class IncomeTaxPage extends StatelessWidget {
  const IncomeTaxPage({super.key});

  static const blue = Color(0xff2f80ff);
  static const bg = Color(0xfff5f6fa);
  static const lightText = Color(0xffa4abb6);
  static const darkText = Color(0xff303236);

  final List<IncomeRecord> records = const [
    IncomeRecord(month: '2026-05', company: '优视科技（中国）有限公司', income: 32222.37, tax: 1763.89),
    IncomeRecord(month: '2026-04', company: '优视科技（中国）有限公司', income: 32378.57, tax: 1779.52),
    IncomeRecord(month: '2026-03', company: '优视科技（中国）有限公司', income: 32650.00, tax: 1806.66),
    IncomeRecord(month: '2026-02', company: '优视科技（中国）有限公司', income: 32200.00, tax: 1761.66),
    IncomeRecord(month: '2026-01', company: '优视科技（中国）有限公司', income: 63525.00, tax: 2374.16),
    IncomeRecord(month: '2025-12', company: '优视科技（中国）有限公司', income: 30000.00, tax: 0.00),
  ];

  @override
  Widget build(BuildContext context) {
    const totalIncome = 192975.94;
    const totalTax = 9485.89;

    return Scaffold(
      backgroundColor: bg,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const _NavigationBar(),
            Container(height: 1, color: const Color(0xffdfe2e7)),
            Container(
              color: Colors.white,
              padding: const EdgeInsets.fromLTRB(36, 25, 36, 14),
              child: const Column(
                children: [
                  _SummaryLine(title: '收入合计', value: '192975.94元', showHelp: true),
                  SizedBox(height: 16),
                  Divider(height: 1, color: Color(0xffe6e8ec)),
                  SizedBox(height: 16),
                  _SummaryLine(title: '已申报税额合计：', value: '9485.89元'),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: records.length,
                itemBuilder: (context, index) {
                  return _IncomeCell(record: records[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _NavigationBar extends StatelessWidget {
  const _NavigationBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 88,
      color: Colors.white,
      padding: const EdgeInsets.only(left: 28, right: 34, top: 12),
      child: Stack(
        alignment: Alignment.center,
        children: [
          const Text(
            '收入纳税明细',
            style: TextStyle(
              color: IncomeTaxPage.darkText,
              fontSize: 26,
              fontWeight: FontWeight.w400,
              letterSpacing: 1,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Icon(Icons.arrow_back_ios_new, color: IncomeTaxPage.blue, size: 28),
                SizedBox(width: 2),
                Text(
                  '返回',
                  style: TextStyle(
                    color: IncomeTaxPage.blue,
                    fontSize: 27,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const Align(
            alignment: Alignment.centerRight,
            child: Text(
              '批量申诉',
              style: TextStyle(
                color: IncomeTaxPage.blue,
                fontSize: 27,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryLine extends StatelessWidget {
  final String title;
  final String value;
  final bool showHelp;

  const _SummaryLine({
    required this.title,
    required this.value,
    this.showHelp = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: IncomeTaxPage.darkText,
            fontSize: 28,
            fontWeight: FontWeight.w600,
          ),
        ),
        if (showHelp) ...[
          const SizedBox(width: 8),
          Container(
            width: 27,
            height: 27,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: IncomeTaxPage.blue, width: 2),
            ),
            child: const Center(
              child: Text(
                '?',
                style: TextStyle(
                  color: IncomeTaxPage.blue,
                  fontSize: 22,
                  height: 1,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          const Text(
            '：',
            style: TextStyle(
              color: IncomeTaxPage.darkText,
              fontSize: 28,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            color: IncomeTaxPage.darkText,
            fontSize: 27,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}

class _IncomeCell extends StatelessWidget {
  final IncomeRecord record;

  const _IncomeCell({required this.record});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 27, color: IncomeTaxPage.bg),
        Container(
          color: Colors.white,
          padding: const EdgeInsets.fromLTRB(36, 34, 28, 32),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          '工资薪金',
                          style: TextStyle(
                            color: IncomeTaxPage.darkText,
                            fontSize: 33,
                            fontWeight: FontWeight.w400,
                            height: 1.1,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          record.month,
                          style: const TextStyle(
                            color: IncomeTaxPage.darkText,
                            fontSize: 31,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(width: 52),
                      ],
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      '所得项目小类：正常工资薪金',
                      style: TextStyle(
                        color: IncomeTaxPage.lightText,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      '扣缴义务人：${record.company.length > 13 ? '优视科技（中国）有限公...' : record.company}',
                      style: const TextStyle(
                        color: IncomeTaxPage.lightText,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      '收入： ${record.income.toStringAsFixed(2)}元',
                      style: const TextStyle(
                        color: IncomeTaxPage.lightText,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        height: 1.15,
                      ),
                    ),
                    const SizedBox(height: 14),
                    Text(
                      '已申报税额： ${record.tax.toStringAsFixed(2)}元',
                      style: const TextStyle(
                        color: IncomeTaxPage.lightText,
                        fontSize: 28,
                        fontWeight: FontWeight.w400,
                        height: 1.15,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios,
                color: Color(0xffc6c8cc),
                size: 33,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
