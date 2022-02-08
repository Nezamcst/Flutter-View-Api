import 'package:flutter/material.dart';

class UserDetailsPage extends StatelessWidget {
  UserDetailsPage({Key? key, required this.fullName, required this.imagePath})
      : super(key: key);
  String fullName;
  String imagePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              radius: 50,
              backgroundColor: Colors.transparent,
              backgroundImage: NetworkImage(imagePath),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(fullName)
          ],
        ),
      ),
    );
  }
}
