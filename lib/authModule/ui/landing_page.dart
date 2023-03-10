import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'login_page.dart';

class ContentBoard {
  final String image, title, desc;

  ContentBoard({
    required this.image,
    required this.title,
    required this.desc,
  });
}

final List<ContentBoard> contentBoard = [
  ContentBoard(
      image: "images/letter-f.png",
      title: "Welcome to Five Media",
      desc: "Express Yourself Here"),
  ContentBoard(
      image: "images/connecting.png",
      title: "Create Your Club",
      desc: "Gather With Poeple Who Share a Same Hobbys With You"),
  ContentBoard(
      image: "images/hobbys.png",
      title: "Do Your Hobbys",
      desc: "Do Your Hobbys With Your Club"),
];

class OnboardWidgetClass extends StatefulWidget {
  const OnboardWidgetClass({
    super.key,
    required this.image,
    required this.title,
    required this.desc,
  });

  final String image, title, desc;

  @override
  State<OnboardWidgetClass> createState() => _OnboardWidgetClassState();
}

class _OnboardWidgetClassState extends State<OnboardWidgetClass> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Spacer(),
        Image.asset(widget.image, height: 200),
        const SizedBox(
          height: 30,
        ),
        Text(
          widget.title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 15,
        ),
        Text(
          widget.desc,
          textAlign: TextAlign.center,
        ),
        const Spacer(),
      ],
    );
  }
}

class OnboardPageClass extends StatefulWidget {
  const OnboardPageClass({super.key});

  @override
  State<OnboardPageClass> createState() => _OnboardPageClassState();
}

class _OnboardPageClassState extends State<OnboardPageClass> {
  late PageController _pageController;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(child,
          maxWidth: 1200,
          minWidth: 480,
          defaultScale: true,
          breakpoints: [
            const ResponsiveBreakpoint.resize(480, name: MOBILE),
            const ResponsiveBreakpoint.autoScale(800, name: TABLET),
            const ResponsiveBreakpoint.resize(1200, name: DESKTOP)
          ]),
      home: Scaffold(
        body: Center(
          child: SafeArea(
            child: Column(
              children: [
                Expanded(
                  child: PageView.builder(
                    itemCount: contentBoard.length,
                    controller: _pageController,
                    itemBuilder: (context, index) => OnboardWidgetClass(
                        image: contentBoard[index].image,
                        title: contentBoard[index].title,
                        desc: contentBoard[index].desc),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      runApp(const LoginPageClass());
                    });
                  },
                  child: const Text("Login"),
                ),
                const SizedBox(
                  height: 50,
                ),
                SmoothPageIndicator(
                    controller: _pageController,
                    count: contentBoard.length,
                    effect: const SlideEffect(
                        dotHeight: 7.5,
                        dotWidth: 7.5,
                        dotColor: Color.fromARGB(15, 5, 5, 5),
                        activeDotColor: Colors.black)),
                const SizedBox(
                  height: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
