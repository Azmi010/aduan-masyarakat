import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../controllers/pelaporan_user_controller.dart';

class PelaporanUserView extends GetView<PelaporanUserController> {
  const PelaporanUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(PelaporanUserController());
    TextEditingController judulController = TextEditingController();
    TextEditingController lokasiController = TextEditingController();
    TextEditingController keteranganController = TextEditingController();

    void reset() {
      judulController.text = '';
      lokasiController.text = '';
      keteranganController.text = '';
    };

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('assets/images/logo.png', height: 100),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      "Silahkan Lengkapi \nData Berikut ini",
                      style: TextStyle(
                          color: Color(0xFF1D3557),
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Judul Aduan",
                        style: TextStyle(
                            color: Color(0xFF1D3557),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: judulController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 20),
                        ),
                        hintText: "Masukan judul aduan",
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Lokasi",
                        style: TextStyle(
                            color: Color(0xFF1D3557),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: lokasiController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 20),
                        ),
                        hintText: "Masukan lokasi Infrastruktur",
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Keterangan",
                        style: TextStyle(
                            color: Color(0xFF1D3557),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: keteranganController,
                      maxLines: 5,
                      minLines: 3,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderSide: BorderSide(width: 1),
                        ),
                        label: Text("Keterangan Kerusakan Infrastruktur"),
                        alignLabelWithHint: true,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Align(
                      alignment: Alignment.centerRight,
                      child: FractionallySizedBox(
                        widthFactor: 0.5,
                        child: ElevatedButton(
                          onPressed: () async {
                            await Get.defaultDialog(
                              title: "Pilih Gambar",
                              content: Column(
                                children: [
                                  ListTile(
                                    leading: Icon(Icons.camera),
                                    title: Text('Kamera'),
                                    onTap: () {
                                      Get.back();
                                      controller.pickImage(ImageSource.camera);
                                    },
                                  ),
                                  ListTile(
                                    leading: Icon(Icons.photo_album),
                                    title: Text('Galeri'),
                                    onTap: () {
                                      Get.back();
                                      controller.pickImage(ImageSource.gallery);
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            shadowColor: const Color.fromARGB(255, 2, 57, 102),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.upload_file),
                              SizedBox(width: 8),
                              Text("Pilih File"),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() {
                      if (controller.imageFile.value != null) {
                        return Image.file(controller.imageFile.value!);
                      } else {
                        return Text('No image selected');
                      }
                    }),
                    const SizedBox(height: 10),
                    ElevatedButton(
                      onPressed: () {
                        String judul = judulController.text;
                        String lokasi = lokasiController.text;
                        String keterangan = keteranganController.text;
                        if (judul.isNotEmpty && lokasi.isNotEmpty && keterangan.isNotEmpty && controller.imageFile.value != null) {
                          controller.submitAduanData(judul, lokasi, keterangan);
                          reset();
                          controller.imageFile.value = null;
                        } else {
                          Get.snackbar('Error', 'Please fill all fields and upload an image');
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 2, 57, 102),
                        fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Ajukan',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
