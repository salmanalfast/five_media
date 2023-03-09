import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class ContentBoard {
  final String image, title, desc;

  ContentBoard({
    required this.image,
    required this.title,
    required this.desc,
  });
}

final List<ContentBoard> content_board = [
  ContentBoard(image: "images/web developer.png", title: "Welcome to Five Universe", desc: "Be Yourself In This Universe"),
];


class ManiOnboardClass extends StatefulWidget {
  const ManiOnboardClass({super.key});

  @override
  State<ManiOnboardClass> createState() => _ManiOnboardClassState();
}

class _ManiOnboardClassState extends State<ManiOnboardClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        maxWidth: 1200,
        minWidth: 480,
        defaultScale: true,
        breakpoints: const [
          ResponsiveBreakpoint.resize(480, name: MOBILE),
          ResponsiveBreakpoint.autoScale(800, name: TABLET),
          ResponsiveBreakpoint.resize(1200, name: DESKTOP)
        ],
      ),

    );
  }
}
