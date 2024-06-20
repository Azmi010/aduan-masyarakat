import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Obx(() {
          return AppBar(
            backgroundColor: const Color.fromRGBO(29, 53, 87, 1),
            title: Text(
              controller.selectedIndex.value == 0
                  ? 'Homepage'
                  : controller.selectedIndex.value == 1
                      ? 'Laporan'
                      : 'Profil', style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            foregroundColor: Colors.white,
            centerTitle: true,
          );
        }),
      ),
      body: Obx(() {
        return IndexedStack(
          index: controller.selectedIndex.value,
          children: controller.views,
        );
      }),
      bottomNavigationBar: Obx(() {
        return BottomNavigationBar(
          backgroundColor: const Color.fromRGBO(29, 53, 87, 1),
          currentIndex: controller.selectedIndex.value,
          onTap: (index) {
            controller.selectedIndex.value = index;
          },
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: const TextStyle(color: Colors.white),
          unselectedLabelStyle: const TextStyle(color: Colors.grey),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              activeIcon: Icon(Icons.home, color: Colors.white),
              label: 'Beranda',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.report_gmailerrorred),
              activeIcon: Icon(Icons.report_gmailerrorred, color: Colors.white),
              label: 'Laporan',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              activeIcon: Icon(Icons.person, color: Colors.white),
              label: 'Profil',
            ),
          ],
        );
      }),
    );
  }
}
