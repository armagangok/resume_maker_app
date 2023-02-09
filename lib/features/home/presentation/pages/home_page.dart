import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.check_circle_outline_rounded,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: const Text("data"),
          ),
        ],
      ),
    );
  }
}
