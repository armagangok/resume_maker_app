import 'package:flutter/material.dart';

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Language"),
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Text("Update"),
          )
        ],
      ),
      body: Column(
        children: const [],
      ),
    );
  }
}

class LanguageItemWidget extends StatelessWidget {
  const LanguageItemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      child: Row(
        children: [
          Checkbox(
            value: true,
            onChanged: (val) {},
          ),
          const Text("English")
        ],
      ),
    );
  }
}
