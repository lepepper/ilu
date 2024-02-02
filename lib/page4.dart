import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class PostPropertyPage extends StatefulWidget {
  const PostPropertyPage({super.key});

  @override
  State<PostPropertyPage> createState() => _PostPropertyPageState();
}

class _PostPropertyPageState extends State<PostPropertyPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page4')),
      body: const Center(child: Text('Page 4 data')),
    );
  }
}
