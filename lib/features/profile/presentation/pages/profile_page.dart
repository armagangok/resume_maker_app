import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: 20,
              itemBuilder: (context, index) {
                return const Padding(
                  padding: EdgeInsets.only(right: 8.0),
                  child: Text("data"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
