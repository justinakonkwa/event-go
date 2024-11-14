// ignore_for_file: file_names

import 'dart:async';

import 'package:eventgo/menu_page.dart';
import 'package:eventgo/widgets/app_text_large.dart';
import 'package:eventgo/widgets/bouton_next.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'intro_page1.dart';
import 'intro_page2.dart';
import 'intro_page3.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  final PageController _controller = PageController(initialPage: 0);

  int _currentPage = 0;
  bool last = false;
  void _startTimer() {
    Timer.periodic(const Duration(seconds: 30), (timer) {
      if (_currentPage < 2) {
        _currentPage++;
      }
      _controller.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 5000),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            onPageChanged: (index) {
              setState(() {
                last = (index == 2);
              });
              setState(() {
                _currentPage = index;
              });
            },
            children: const [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
          Container(
            alignment: const Alignment(0, 0.75),
            child: Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20),
              child: last
                  ? NextButton(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainPage(),
                          ),
                        );
                      },
                      child: AppTextLarge(
                        text: 'Go',
                        color: Theme.of(context).colorScheme.background
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          child: SmoothPageIndicator(
                            controller: _controller,
                            count: 3,
                            effect: WormEffect(
                              radius: 0,
                              dotHeight: 5,
                              activeDotColor:
                                  Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          child: IconButton(
                            onPressed: () {
                              if (_currentPage < 2) {
                                _controller.nextPage(
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.easeInOut,
                                );
                              }
                            },
                            icon: const Icon(Icons.arrow_forward_outlined),
                          ),
                        )
                      ],
                    ),
            ),
          )
        ],
      ),
    );
  }
}
