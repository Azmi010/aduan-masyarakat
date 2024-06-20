import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding1_controller.dart';

class Onboarding1View extends GetView<Onboarding1Controller> {
  const Onboarding1View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 241, 250, 238),
      ),
      backgroundColor: const Color.fromARGB(255, 241, 250, 238),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/tutorial1.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'Hubungi Petugas',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 53, 87),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Segera menghubungi petugas',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 53, 87),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Melalui aplikasi Layanan Pengaduan',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 53, 87),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'Kerusakan Fasilitas Umum',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 53, 87),
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                  height: 20),
              const SizedBox(height: 100), 
            ],
          ),
        ),
      ),
    );
  }
}
