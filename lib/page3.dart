import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page3')),
      body: const Center(child: Text('Page 3 data')),
    );
  }
}
