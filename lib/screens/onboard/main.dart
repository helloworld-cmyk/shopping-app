import 'package:flutter/material.dart';

import 'controller/onboard_controller.dart';
import 'widget/onboard_page_data.dart';
import 'widget/onboard_slide.dart';

class OnboardScreen extends StatefulWidget {
  const OnboardScreen({super.key});

  @override
  State<OnboardScreen> createState() => _OnboardScreenState();
}

class _OnboardScreenState extends State<OnboardScreen> {
  late final OnboardController _controller;

  @override
  void initState() {
    super.initState();
    _controller = OnboardController()..addListener(_handleControllerChanged);
  }

  void _handleControllerChanged() {
    if (!_controller.shouldNavigateToLogin || !mounted) return;

    _controller.consumeLoginNavigation();
    Navigator.of(context).pushReplacementNamed('/login');
  }

  Future<void> _goToNextPage() async {
    await _controller.goToNextPage();
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_handleControllerChanged)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: AnimatedBuilder(
        animation: _controller.pageController,
        builder: (context, child) {
          final page = _controller.pagePosition;

          return PageView.builder(
            controller: _controller.pageController,
            physics: const PageScrollPhysics(),
            itemCount: onboardPages.length,
            onPageChanged: _controller.onPageChanged,
            itemBuilder: (context, index) {
              return OnboardSlide(
                data: onboardPages[index],
                index: index,
                page: page,
                onNext: _goToNextPage,
              );
            },
          );
        },
      ),
    );
  }
}
