import 'package:flutter/material.dart';
class CustomDialog extends StatelessWidget {
  final String title;
  CustomDialog({required this.title});
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // The loading indicator
            CircularProgressIndicator(),
            SizedBox(
              height: 15,
            ),
            Text(title)
          ],
        ),
      ),
    );
  }
}