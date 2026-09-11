import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SecondPage extends StatefulWidget {
  const new({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  final _controller = TextEditingController(text: '');
  var textScreen = 'Second page';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Center(child: Text(textScreen),),
            TextField(controller: _controller, decoration: InputDecoration(border: OutlineInputBorder(), label: Text("My label")),),
            ElevatedButton(onPressed: () => {
              context.go('/form')
            },child: Text("Update"))
          ],
        )
      )
    );
  }
}