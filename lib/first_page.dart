import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FirstPage extends StatefulWidget {
  const new({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  final _controller = TextEditingController(text: '');
  var textScreen = 'First page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Center(child: Text(textScreen),),
            TextField(controller: _controller, decoration: InputDecoration(border: OutlineInputBorder(), label: Text("My label")),),
            ElevatedButton(onPressed: () => {
              context.go('/second')
            },child: Text("Update"))
          ],
        )
      )
    );
  }
}