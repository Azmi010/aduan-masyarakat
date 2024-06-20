import 'package:aduan/app/modules/Splashes/onboarding1/views/onboarding1_view.dart';
import 'package:aduan/app/modules/Splashes/onboarding2/views/onboarding2_view.dart';
import 'package:aduan/app/modules/Splashes/onboarding3/views/onboarding3_view.dart';
import 'package:flutter/material.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:get/get.dart';

import '../controllers/tap_geser_controller.dart';


class TapGeserView extends GetView<TapGeserController> {
  final _pageController = PageController(initialPage: 0);
  final _activePage = 0.obs; 

  final List<Widget> _page = [
    const Onboarding1View(),
    const Onboarding2View(),
    const Onboarding3View(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
            controller: _pageController,
            onPageChanged: (int page) {
              _activePage.value = page; // Perbarui nilai _activePage saat halaman berubah
            },
            itemCount: _page.length,
            itemBuilder: (BuildContext context, int index) {
              return _page[index % _page.length];
            },
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.25,
            left: 0,
            right: 0,
            child: _dotsIndicator(),
          ),
        ],
      ),
    );
  }

  Widget _dotsIndicator() {
    return Obx(() => DotsIndicator(
          dotsCount: _page.length,
          position: _activePage.value.toDouble(), // Mengubah nilai _activePage ke int
          decorator: DotsDecorator(
            color: const Color.fromRGBO(29, 53, 87, 1),
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
        ));
  }
}
