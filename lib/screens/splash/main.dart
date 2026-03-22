import 'package:flutter/material.dart';

import 'widget/splash_background.dart';
import 'widget/splash_footer.dart';
import 'widget/splash_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 2400),
  )..repeat();

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;
      Navigator.of(context).pushReplacementNamed('/onboard');
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned.fill(child: SplashBackground()),
          SafeArea(
            child: Stack(
              children: [
                Center(child: SplashLogo(animation: _controller)),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: SplashFooter(animation: _controller),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
