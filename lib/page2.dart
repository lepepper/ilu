import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PropManagerPage extends StatefulWidget {
  const PropManagerPage({super.key});

  @override
  State<PropManagerPage> createState() => _PropManagerPageState();
}

class _PropManagerPageState extends State<PropManagerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page2')),
      body: const Center(child: Text('Page 2 data')),
    );
  }
}
