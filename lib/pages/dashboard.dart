import 'package:flutter/material.dart';
import 'package:raaqib_admin_frontend/widgets/cards_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final List<String> titles = [
    "Pending reports",
    "Resolved result",
    "Active bans",
    "Active suspends",
  ];
  final List<int> valus = [10, 23, 3, 45];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // card
        SizedBox(
          height: 100,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: titles.length,
            itemBuilder: (context, index) {
              final title = titles[index];
              final value = valus[index];
              return CardsWidget(title: title, value: value);
            },
          ),
        ),

        // grafs of daily posts
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(8),
          width: double.infinity,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black, width: 0.3),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Daily posts",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
