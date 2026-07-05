import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text('我的')),
    body: ListView(padding: const EdgeInsets.all(16), children: const [
      Card(child: ListTile(leading: CircleAvatar(child: Icon(Icons.person)), title: Text('演示用户'), subtitle: Text('手机号：138****8888'))),
      SizedBox(height: 10),
      Card(child: ListTile(leading: Icon(Icons.verified_user_outlined), title: Text('实名认证'), trailing: Text('已模拟'))),
      Card(child: ListTile(leading: Icon(Icons.storage_outlined), title: Text('本地数据'), subtitle: Text('演示数据，本地运行'))),
      Card(child: ListTile(leading: Icon(Icons.security), title: Text('安全设置'))),
      Card(child: ListTile(leading: Icon(Icons.info_outline), title: Text('关于应用'), subtitle: Text('原创演示项目，不连接官方系统'))),
    ]),
  );
}
