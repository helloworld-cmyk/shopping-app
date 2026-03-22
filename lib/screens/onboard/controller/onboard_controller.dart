import 'package:flutter/material.dart';

import '../widget/onboard_page_data.dart';

class OnboardController extends ChangeNotifier {
  OnboardController() : pageController = PageController();

  final PageController pageController;

  int _currentIndex = 0;
  bool _shouldNavigateToLogin = false;

  int get currentIndex => _currentIndex;

  bool get shouldNavigateToLogin => _shouldNavigateToLogin;

  double get pagePosition {
    if (pageController.hasClients) {
      return pageController.page ?? _currentIndex.toDouble();
    }

    return _currentIndex.toDouble();
  }

  void onPageChanged(int index) {
    _currentIndex = index;
    notifyListeners();
  }

  Future<void> goToNextPage() async {
    final isLastPage = _currentIndex >= onboardPages.length - 1;

    if (isLastPage) {
      _shouldNavigateToLogin = true;
      notifyListeners();
      return;
    }

    await pageController.animateToPage(
      _currentIndex + 1,
      duration: const Duration(milliseconds: 700),
      curve: Curves.easeInOutCubicEmphasized,
    );
  }

  void consumeLoginNavigation() {
    _shouldNavigateToLogin = false;
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
