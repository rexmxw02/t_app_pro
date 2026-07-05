import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xfff5f6fa),
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '收入纳税明细',
      debugShowCheckedModeBanner: false,
      builder: (context, child) {
        final mq = MediaQuery.of(context);
        return MediaQuery(
          data: mq.copyWith(textScaler: TextScaler.noScaling),
          child: child!,
        );
      },
      theme: ThemeData(
        useMaterial3: false,
        fontFamily: 'sans',
        scaffoldBackgroundColor: C.bg,
      ),
      home: const IncomeTaxPage(),
    );
  }
}

class C {
  static const bg = Color(0xfff5f6fa);
  static const white = Color(0xffffffff);
  static const blue = Color(0xff2f80ed);
  static const title = Color(0xff2f3337);
  static const sub = Color(0xff9aa1ab);
  static const line = Color(0xffe4e5e9);
  static const arrow = Color(0xffc8c9cd);
}

class IncomeItem {
  final String? month;
  final double income;
  final double tax;

  const IncomeItem({this.month, required this.income, required this.tax});
}

const data = [
  IncomeItem(income: 32378.57, tax: 1779.52),
  IncomeItem(month: '2026-05', income: 32222.37, tax: 1763.89),
  IncomeItem(month: '2026-04', income: 32378.57, tax: 1779.52),
  IncomeItem(month: '2026-03', income: 32650.00, tax: 1806.66),
  IncomeItem(month: '2026-02', income: 32200.00, tax: 1761.66),
  IncomeItem(month: '2026-01', income: 63525.00, tax: 2374.16),
];

class IncomeTaxPage extends StatelessWidget {
  const IncomeTaxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: C.bg,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Nav(),
            const Header(),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: data.length,
                itemBuilder: (_, i) => IncomeCell(item: data[i]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Nav extends StatelessWidget {
  const Nav({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: const BoxDecoration(
        color: C.white,
        border: Border(bottom: BorderSide(color: C.line, width: .6)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 17),
      child: Row(
        children: [
          SizedBox(
            width: 92,
            child: Row(
              children: const [
                Icon(Icons.arrow_back_ios_new, size: 20, color: C.blue),
                SizedBox(width: 2),
                Text('返回', style: TextStyle(color: C.blue, fontSize: 18, fontWeight: FontWeight.w400)),
              ],
            ),
          ),
          const Expanded(
            child: Center(
              child: Text(
                '收入纳税明细',
                maxLines: 1,
                style: TextStyle(color: C.title, fontSize: 20, fontWeight: FontWeight.w400),
              ),
            ),
          ),
          const SizedBox(
            width: 92,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('批量申诉', style: TextStyle(color: C.blue, fontSize: 18, fontWeight: FontWeight.w400)),
            ),
          ),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 13, color: C.bg),
        Container(
          color: C.white,
          padding: const EdgeInsets.fromLTRB(18, 25, 18, 19),
          child: const Column(
            children: [
              SummaryRow(label: '收入合计', value: '192975.94元', help: true),
              SizedBox(height: 17),
              Divider(height: 1, thickness: .7, color: C.line),
              SizedBox(height: 17),
              SummaryRow(label: '已申报税额合计：', value: '9485.89元'),
            ],
          ),
        ),
        Container(height: 14, color: C.bg),
      ],
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool help;

  const SummaryRow({super.key, required this.label, required this.value, this.help = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(label, style: const TextStyle(color: C.title, fontSize: 19, fontWeight: FontWeight.w500)),
        if (help) ...[
          const SizedBox(width: 5),
          Container(
            width: 20,
            height: 20,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: C.blue, width: 1.2),
              shape: BoxShape.circle,
            ),
            child: const Text('?', style: TextStyle(color: C.blue, fontSize: 15, height: 1, fontWeight: FontWeight.w300)),
          ),
          const Text('：', style: TextStyle(color: C.title, fontSize: 19, fontWeight: FontWeight.w500)),
        ],
        const Spacer(),
        Text(value, style: const TextStyle(color: C.title, fontSize: 18, fontWeight: FontWeight.w500)),
      ],
    );
  }
}

class IncomeCell extends StatelessWidget {
  final IncomeItem item;
  const IncomeCell({super.key, required this.item});

  bool get hasTitle => item.month != null;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: C.white,
          padding: EdgeInsets.fromLTRB(18, hasTitle ? 23 : 14, 18, hasTitle ? 21 : 19),
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
                          const Text('工资薪金', style: TextStyle(color: C.title, fontSize: 22, fontWeight: FontWeight.w500, height: 1)),
                          const Spacer(),
                          Text(item.month!, style: const TextStyle(color: C.title, fontSize: 22, fontWeight: FontWeight.w400, height: 1)),
                          const SizedBox(width: 36),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Text('所得项目小类： 正常工资薪金', style: detailStyle),
                      const SizedBox(height: 10),
                    ],
                    const Text('扣缴义务人： 优视科技（中国）有限公...', style: detailStyle, maxLines: 1, overflow: TextOverflow.clip),
                    const SizedBox(height: 10),
                    Text('收入：  ${item.income.toStringAsFixed(2)}元', style: detailStyle),
                    const SizedBox(height: 10),
                    Text('已申报税额：  ${item.tax.toStringAsFixed(2)}元', style: detailStyle),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(Icons.arrow_forward_ios, color: C.arrow, size: 24),
            ],
          ),
        ),
        Container(height: 14, color: C.bg),
      ],
    );
  }

  static const detailStyle = TextStyle(
    color: C.sub,
    fontSize: 18,
    fontWeight: FontWeight.w400,
    height: 1.08,
  );
}
