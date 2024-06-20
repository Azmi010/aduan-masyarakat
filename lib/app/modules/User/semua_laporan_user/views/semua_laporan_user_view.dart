import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/semua_laporan_user_controller.dart';

class SemuaLaporanUserView extends GetView<SemuaLaporanUserController> {
  const SemuaLaporanUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SemuaLaporanUserController());

    return Scaffold(
      body: Obx(() {
        if (controller.laporanList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return PageView.builder(
          itemCount: controller.laporanList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final laporan = controller.laporanList[index];

            return Stack(
              children: [
                Positioned.fill(
                  child: laporan['gambar'] != null && laporan['gambar'].isNotEmpty
                      ? Image.network(
                          laporan['gambar'],
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Center(
                            child: Icon(
                              Icons.image_not_supported,
                              color: Colors.grey,
                              size: 50,
                            ),
                          ),
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return const Center(child: CircularProgressIndicator());
                          },
                        )
                      : const Center(
                          child: Icon(
                            Icons.image,
                            color: Colors.grey,
                            size: 50,
                          ),
                        ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.03,
                  right: MediaQuery.of(context).size.width * 0.03,
                  bottom: MediaQuery.of(context).size.height * 0.03,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10.0),
                        child: Text(
                          laporan['user']['username'] ?? 'Unknown User',
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Text(
                        laporan['judul'] ?? 'No Title',
                        style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        laporan['keterangan'] ?? 'No Description',
                        style: const TextStyle(color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        laporan['created_at'] ?? 'Unknown Date',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 126, 125, 125),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.03,
                  bottom: MediaQuery.of(context).size.height * 0.25,
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: () => controller.toggleFavoriteColor(index),
                        icon: Icon(
                          (laporan['liked'] ?? false) ? Icons.favorite : Icons.favorite_border,
                          color: (laporan['liked'] ?? false) ? Colors.red : Colors.white,
                          size: 30,
                        ),
                      ),
                      Text(
                        "${laporan['like'] ?? 0}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        onPressed: () {
                          // Implementasi fitur send bisa ditambahkan di sini
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
