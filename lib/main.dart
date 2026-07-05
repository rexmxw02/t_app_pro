import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
    statusBarIconBrightness: Brightness.light,
    systemNavigationBarColor: Color(0xfff3f4f9),
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
        fontFamily: 'sans-serif',
        scaffoldBackgroundColor: Px.bg,
      ),
      home: const IncomeTaxPage(),
    );
  }
}

class Px {
  // 从安卓截图取样后写死的颜色
  static const bg = Color(0xfff3f4f9);
  static const white = Color(0xffffffff);
  static const blue = Color(0xff4d84d9);
  static const black = Color(0xff2f3135);
  static const gray = Color(0xff9ea3ad);
  static const line = Color(0xffe2e3e7);
  static const arrow = Color(0xffc6c9cf);

  // 基准：截图宽 864px，常见渲染宽约 393dp
  static double s(BuildContext context) => MediaQuery.of(context).size.width / 393.0;
  static double v(BuildContext context, double n) => n * s(context);
}

class Item {
  final String? month;
  final String income;
  final String tax;
  const Item({this.month, required this.income, required this.tax});
}

const items = [
  Item(income: '32378.57', tax: '1779.52'),
  Item(month: '2026-05', income: '32222.37', tax: '1763.89'),
  Item(month: '2026-04', income: '32378.57', tax: '1779.52'),
  Item(month: '2026-03', income: '32650.00', tax: '1806.66'),
  Item(month: '2026-02', income: '32200.00', tax: '1761.66'),
  Item(month: '2026-01', income: '63525.00', tax: '2374.16'),
];

class IncomeTaxPage extends StatelessWidget {
  const IncomeTaxPage({super.key});

  @override
  Widget build(BuildContext context) {
    final s = Px.s(context);
    return Scaffold(
      backgroundColor: Px.bg,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const TaxNav(),
            const TaxSummary(),
            Expanded(
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: items.length,
                itemBuilder: (_, i) => TaxCell(item: items[i]),
              ),
            ),
            SizedBox(height: 0 * s),
          ],
        ),
      ),
    );
  }
}

class TaxNav extends StatelessWidget {
  const TaxNav({super.key});

  @override
  Widget build(BuildContext context) {
    final s = Px.s(context);

    return Container(
      height: 57 * s,
      decoration: const BoxDecoration(
        color: Px.white,
        border: Border(bottom: BorderSide(color: Px.line, width: 0.7)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 17 * s),
      child: Row(
        children: [
          SizedBox(
            width: 99 * s,
            child: Row(
              children: [
                Icon(Icons.arrow_back_ios_new, color: Px.blue, size: 20 * s),
                SizedBox(width: 2 * s),
                Text(
                  '返回',
                  style: TextStyle(
                    color: Px.blue,
                    fontSize: 18.5 * s,
                    fontWeight: FontWeight.w400,
                    height: 1,
                    letterSpacing: -0.2,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                '收入纳税明细',
                style: TextStyle(
                  color: Px.black,
                  fontSize: 20.5 * s,
                  fontWeight: FontWeight.w400,
                  height: 1,
                  letterSpacing: 0.1,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 99 * s,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(
                '批量申诉',
                style: TextStyle(
                  color: Px.blue,
                  fontSize: 18.5 * s,
                  fontWeight: FontWeight.w400,
                  height: 1,
                  letterSpacing: -0.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TaxSummary extends StatelessWidget {
  const TaxSummary({super.key});

  @override
  Widget build(BuildContext context) {
    final s = Px.s(context);
    return Column(
      children: [
        Container(height: 13.5 * s, color: Px.bg),
        Container(
          color: Px.white,
          padding: EdgeInsets.fromLTRB(18 * s, 25 * s, 18 * s, 20 * s),
          child: Column(
            children: [
              const SummaryRow(label: '收入合计', value: '192975.94元', help: true),
              SizedBox(height: 17 * s),
              Container(height: 0.7, color: Px.line),
              SizedBox(height: 17 * s),
              const SummaryRow(label: '已申报税额合计：', value: '9485.89元'),
            ],
          ),
        ),
        Container(height: 14 * s, color: Px.bg),
      ],
    );
  }
}

class SummaryRow extends StatelessWidget {
  final String label;
  final String value;
  final bool help;
  const SummaryRow({
    super.key,
    required this.label,
    required this.value,
    this.help = false,
  });

  @override
  Widget build(BuildContext context) {
    final s = Px.s(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Px.black,
            fontSize: 19.2 * s,
            fontWeight: FontWeight.w500,
            height: 1,
            letterSpacing: -0.15,
          ),
        ),
        if (help) ...[
          SizedBox(width: 5 * s),
          Container(
            width: 20 * s,
            height: 20 * s,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Px.blue, width: 1.3 * s),
            ),
            child: Text(
              '?',
              style: TextStyle(
                color: Px.blue,
                fontSize: 15 * s,
                fontWeight: FontWeight.w300,
                height: 1,
              ),
            ),
          ),
          Text(
            '：',
            style: TextStyle(
              color: Px.black,
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
            color: Px.black,
            fontSize: 18.2 * s,
            fontWeight: FontWeight.w500,
            height: 1,
            letterSpacing: -0.1,
          ),
        ),
      ],
    );
  }
}

class TaxCell extends StatelessWidget {
  final Item item;
  const TaxCell({super.key, required this.item});

  bool get header => item.month != null;

  @override
  Widget build(BuildContext context) {
    final s = Px.s(context);
    return Column(
      children: [
        Container(
          color: Px.white,
          padding: EdgeInsets.fromLTRB(
            18 * s,
            header ? 23 * s : 15 * s,
            18 * s,
            header ? 21 * s : 19 * s,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (header) ...[
                      Row(
                        children: [
                          Text(
                            '工资薪金',
                            style: TextStyle(
                              color: Px.black,
                              fontSize: 22.4 * s,
                              fontWeight: FontWeight.w500,
                              height: 1,
                              letterSpacing: -0.2,
                            ),
                          ),
                          const Spacer(),
                          Text(
                            item.month!,
                            style: TextStyle(
                              color: Px.black,
                              fontSize: 22.0 * s,
                              fontWeight: FontWeight.w400,
                              height: 1,
                              letterSpacing: -0.1,
                            ),
                          ),
                          SizedBox(width: 34 * s),
                        ],
                      ),
                      SizedBox(height: 16 * s),
                      DetailText('所得项目小类： 正常工资薪金', s: s),
                      SizedBox(height: 10 * s),
                    ],
                    DetailText('扣缴义务人： 优视科技（中国）有限公...', s: s),
                    SizedBox(height: 10 * s),
                    DetailText('收入：  ${item.income}元', s: s),
                    SizedBox(height: 10 * s),
                    DetailText('已申报税额：  ${item.tax}元', s: s),
                  ],
                ),
              ),
              SizedBox(width: 8 * s),
              Icon(Icons.arrow_forward_ios, color: Px.arrow, size: 24 * s),
            ],
          ),
        ),
        Container(height: 14 * s, color: Px.bg),
      ],
    );
  }
}

class DetailText extends StatelessWidget {
  final String text;
  final double s;
  const DetailText(this.text, {super.key, required this.s});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.clip,
      style: TextStyle(
        color: Px.gray,
        fontSize: 18.1 * s,
        fontWeight: FontWeight.w400,
        height: 1.08,
        letterSpacing: 0,
      ),
    );
  }
}
