import 'package:aduan/app/modules/Admin/pelaporan_admin/controllers/pelaporan_admin_controller.dart';
import 'package:aduan/app/modules/User/semua_laporan_user/controllers/semua_laporan_user_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:aduan/app/modules/Admin/detail_laporan_admin/views/detail_laporan_admin_view.dart';

class PelaporanAdminView extends GetView<PelaporanAdminController> {
  const PelaporanAdminView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SemuaLaporanUserController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pelaporan Admin'),
      ),
      body: Obx(() {
        if (controller.laporanList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return ListView.builder(
          itemCount: controller.laporanList.length,
          itemBuilder: (context, index) {
            final laporan = controller.laporanList[index];
            return GestureDetector(
              onTap: () {
                Get.to(() => DetailLaporanAdminView(), arguments: laporan);
              },
              child: Card(
                margin: const EdgeInsets.all(10),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (laporan['gambar'] != null && laporan['gambar'].isNotEmpty)
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                        ),
                        child: Image.network(
                          laporan['gambar'],
                          width: double.infinity,
                          height: 200,
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
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            laporan['judul'] ?? 'No Title',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            laporan['created_at'] ?? 'Unknown Date',
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.grey,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    (laporan['liked'] ?? false)
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: (laporan['liked'] ?? false)
                                        ? Colors.red
                                        : Colors.grey,
                                  ),
                                  Text(
                                    "${laporan['like'] ?? 0}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}
