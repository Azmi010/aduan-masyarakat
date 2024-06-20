import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding2_controller.dart';

class Onboarding2View extends GetView<Onboarding2Controller> {
  const Onboarding2View({super.key});
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
                'assets/images/tutorial2.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'Sampaikan Pengaduan',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 53, 87),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Lengkapi laporan anda disertai',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 53, 87),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5), // Menambahkan spasi antara tulisan
              const Text(
                'dengan bukti foto, video, atau',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 53, 87),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'dokumen pada menu pengaduan',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 53, 87),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 20),
              const SizedBox(height: 100), 

            ],
          ),
        ),
      ),
    );
  }
}
