import 'package:flutter/material.dart';

class CardsWidget extends StatelessWidget {
  final String title;
  final int value;
  const CardsWidget({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width * 0.19,
      alignment: Alignment.centerLeft,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey.shade200,
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
          Text("$value", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
