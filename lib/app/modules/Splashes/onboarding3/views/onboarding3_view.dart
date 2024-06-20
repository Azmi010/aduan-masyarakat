import 'package:aduan/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/onboarding3_controller.dart';

class Onboarding3View extends GetView<Onboarding3Controller> {
  const Onboarding3View({super.key});
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
                'assets/images/tutorial3.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                'Pencatatan & Verifikasi',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 53, 87),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Petugas akan mencatat laporan anda',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 53, 87),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'dan silahkan mengecek pada menu',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 53, 87),
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                'daftar pengaduan',
                style: TextStyle(
                  color: Color.fromARGB(255, 29, 53, 87),
                  fontSize: 14,
                ),
              ),
              const SizedBox(
                  height: 100), // Menambahkan spasi antara gambar dan teks
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: const EdgeInsets.only(right: 30),
                    child: ElevatedButton(
                      onPressed: () {
                        Get.offAllNamed(Routes.LOGIN);
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(150, 60),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                          side: const BorderSide(width: 2, color: Colors.white),
                        ),
                        backgroundColor: const Color.fromARGB(255, 29, 53, 87),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0,
                            vertical: 15.0), // Hapus warna latar belakang
                      ),
                      child: const Row(
                        children: [
                          Text(
                            'Mulai',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 15,),
                          Icon(Icons.arrow_forward, color: Colors.white,),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
