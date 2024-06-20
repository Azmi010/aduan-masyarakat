import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/navbar_admin_controller.dart';

class NavbarAdminView extends GetView<NavbarAdminController> {
  const NavbarAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Obx(() {
          return AppBar(
            backgroundColor: const Color.fromRGBO(29, 53, 87, 1),
            title: Text(
              controller.selectedIndex.value == 0 ? 'Homepage' 
              : controller.selectedIndex.value == 1 ? 'Persetujuan' 
              : 'Profil',
              style: const TextStyle(fontWeight: FontWeight.bold),
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
              icon: Icon(Icons.report),
              activeIcon: Icon(Icons.report, color: Colors.white),
              label: 'Persetujuan',
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
