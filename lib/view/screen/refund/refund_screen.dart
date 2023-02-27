import 'package:flutter/material.dart';
class RefundScreen extends StatefulWidget {
  const RefundScreen({Key? key}) : super(key: key);

  @override
  State<RefundScreen> createState() => _RefundScreenState();
}

class _RefundScreenState extends State<RefundScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(color: Colors.blue, alignment: Alignment.center,child: Text("Refund"),);
  }
}
