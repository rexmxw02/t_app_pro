import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xfff5f6fa),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const TaxDetailApp());
}

class TaxDetailApp extends StatelessWidget {
  const TaxDetailApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '收入纳税明细',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'sans',
        scaffoldBackgroundColor: AppColors.bg,
      ),
      home: const IncomeTaxDetailPage(),
    );
  }
}

class AppColors {
  static const bg = Color(0xfff5f6fa);
  static const white = Color(0xffffffff);
  static const blue = Color(0xff2f80ed);
  static const title = Color(0xff22252a);
  static const text = Color(0xff2b2f33);
  static const gray = Color(0xff989ea8);
  static const arrow = Color(0xffc7c9ce);
  static const line = Color(0xffe2e3e7);
}

class IncomeItem {
  final String month;
  final double income;
  final double tax;
  final bool header;

  const IncomeItem(this.month, this.income, this.tax, {this.header = true});
}

const items = [
  IncomeItem('', 32378.57, 1779.52, header: false),
  IncomeItem('2026-05', 32222.37, 1763.89),
  IncomeItem('2026-04', 32378.57, 1779.52),
  IncomeItem('2026-03', 32650.00, 1806.66),
  IncomeItem('2026-02', 32200.00, 1761.66),
  IncomeItem('2026-01', 63525.00, 2374.16),
];

class IncomeTaxDetailPage extends StatelessWidget {
  const IncomeTaxDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final topSafe = MediaQuery.of(context).padding.top;

    return Scaffold(
      backgroundColor: AppColors.bg,
      body: Column(
        children: [
          Container(height: topSafe, color: Colors.black),
          const NavBar(),
          const HeaderPanel(),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: items.length,
              itemBuilder: (_, index) => IncomeRow(item: items[index]),
            ),
          ),
        ],
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 97,
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: AppColors.line, width: 1)),
      ),
      padding: const EdgeInsets.only(left: 32, right: 32),
      child: Stack(
        alignment: Alignment.center,
        children: const [
          Text(
            '收入纳税明细',
            style: TextStyle(
              color: AppColors.title,
              fontSize: 31,
              fontWeight: FontWeight.w400,
              height: 1,
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.arrow_back_ios_new, color: AppColors.blue, size: 31),
                SizedBox(width: 1),
                Text(
                  '返回',
                  style: TextStyle(
                    color: AppColors.blue,
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                    height: 1,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              '批量申诉',
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 30,
                fontWeight: FontWeight.w400,
                height: 1,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderPanel extends StatelessWidget {
  const HeaderPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 27, color: AppColors.bg),
        Container(
          color: AppColors.white,
          padding: const EdgeInsets.fromLTRB(37, 34, 37, 34),
          child: const Column(
            children: [
              SummaryLine(title: '收入合计', value: '192975.94元', help: true),
              SizedBox(height: 25),
              Divider(height: 1, thickness: 1, color: AppColors.line),
              SizedBox(height: 25),
              SummaryLine(title: '已申报税额合计：', value: '9485.89元'),
            ],
          ),
        ),
        Container(height: 28, color: AppColors.bg),
      ],
    );
  }
}

class SummaryLine extends StatelessWidget {
  final String title;
  final String value;
  final bool help;

  const SummaryLine({
    super.key,
    required this.title,
    required this.value,
    this.help = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: const TextStyle(
            color: AppColors.text,
            fontSize: 31,
            fontWeight: FontWeight.w500,
            height: 1,
          ),
        ),
        if (help) ...[
          const SizedBox(width: 8),
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: AppColors.blue, width: 2),
            ),
            alignment: Alignment.center,
            child: const Text(
              '?',
              style: TextStyle(
                color: AppColors.blue,
                fontSize: 24,
                fontWeight: FontWeight.w300,
                height: .95,
              ),
            ),
          ),
          const Text(
            '：',
            style: TextStyle(
              color: AppColors.text,
              fontSize: 31,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          ),
        ],
        const Spacer(),
        Text(
          value,
          style: const TextStyle(
            color: AppColors.text,
            fontSize: 30,
            fontWeight: FontWeight.w500,
            height: 1,
          ),
        ),
      ],
    );
  }
}

class IncomeRow extends StatelessWidget {
  final IncomeItem item;

  const IncomeRow({super.key, required this.item});

  static const detailStyle = TextStyle(
    color: AppColors.gray,
    fontSize: 29,
    fontWeight: FontWeight.w400,
    height: 1,
    letterSpacing: .1,
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColors.white,
          padding: EdgeInsets.fromLTRB(37, item.header ? 39 : 24, 36, item.header ? 34 : 30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.header) ...[
                      Row(
                        children: [
                          const Text(
                            '工资薪金',
                            style: TextStyle(
                              color: AppColors.text,
                              fontSize: 33,
                              fontWeight: FontWeight.w500,
                              height: 1,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            item.month,
                            style: const TextStyle(
                              color: AppColors.text,
                              fontSize: 33,
                              fontWeight: FontWeight.w400,
                              height: 1,
                            ),
                          ),
                          const SizedBox(width: 70),
                        ],
                      ),
                      const SizedBox(height: 29),
                      const Text('所得项目小类： 正常工资薪金', style: detailStyle),
                      const SizedBox(height: 20),
                    ],
                    const Text('扣缴义务人： 优视科技（中国）有限公...', style: detailStyle),
                    const SizedBox(height: 20),
                    Text('收入：  ${item.income.toStringAsFixed(2)}元', style: detailStyle),
                    const SizedBox(height: 20),
                    Text('已申报税额：  ${item.tax.toStringAsFixed(2)}元', style: detailStyle),
                  ],
                ),
              ),
              const Icon(Icons.arrow_forward_ios, color: AppColors.arrow, size: 35),
            ],
          ),
        ),
        Container(height: 28, color: AppColors.bg),
      ],
    );
  }
}
