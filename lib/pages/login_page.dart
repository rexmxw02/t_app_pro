import 'package:flutter/material.dart';
import 'main_shell.dart';

class LoginPage extends StatelessWidget {
  final VoidCallback onToggleTheme;

  const LoginPage({super.key, required this.onToggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(alignment: Alignment.centerRight, child: IconButton(onPressed: onToggleTheme, icon: const Icon(Icons.dark_mode_outlined))),
              const Spacer(),
              const Icon(Icons.account_balance_outlined, size: 82, color: Color(0xff1677ff)),
              const SizedBox(height: 18),
              const Text('个人税务服务', textAlign: TextAlign.center, style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              const Text('收入、纳税、申诉与统计一站式管理', textAlign: TextAlign.center),
              const SizedBox(height: 36),
              TextField(decoration: InputDecoration(labelText: '手机号', prefixIcon: const Icon(Icons.phone_android), border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)))),
              const SizedBox(height: 14),
              TextField(decoration: InputDecoration(labelText: '验证码', suffixText: '获取验证码', prefixIcon: const Icon(Icons.verified_outlined), border: OutlineInputBorder(borderRadius: BorderRadius.circular(14)))),
              const SizedBox(height: 24),
              FilledButton(
                onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const MainShell())),
                child: const Padding(padding: EdgeInsets.symmetric(vertical: 14), child: Text('登录 / 体验演示')),
              ),
              const Spacer(),
              const Text('原创演示应用，不连接任何官方税务系统。', textAlign: TextAlign.center, style: TextStyle(fontSize: 12)),
            ],
          ),
        ),
      ),
    );
  }
}
