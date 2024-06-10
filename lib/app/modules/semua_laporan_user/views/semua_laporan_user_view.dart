import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/semua_laporan_user_controller.dart';

class SemuaLaporanUserView extends GetView<SemuaLaporanUserController> {
  const SemuaLaporanUserView({super.key});

  @override
  Widget build(BuildContext context) {
    final SemuaLaporanUserController iconController = Get.put(SemuaLaporanUserController());

    return Scaffold(
      body: Obx(() {
        if (iconController.laporanList.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return PageView.builder(
          itemCount: iconController.laporanList.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
            final laporan = iconController.laporanList[index];
            bool isLiked = laporan['liked'] ?? false;
            return Stack(
              children: [
                Positioned.fill(
                  child: Image.network(
                    laporan['gambar'] ?? '',
                    fit: BoxFit.cover,
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
                          laporan['user']['username'] ?? '',
                          style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        ),
                      ),
                      Text(
                        laporan['judul'] ?? '',
                        style: TextStyle(
                            color: Colors.grey[200],
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                      Container(
                        padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0),
                        child: Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: laporan['deskripsi'] ?? '',
                                style: const TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(
                          laporan['created_at'] ?? '',
                          style: const TextStyle(
                              color: Color.fromARGB(255, 126, 125, 125),
                              fontWeight: FontWeight.bold,
                              fontSize: 16),
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
                        onPressed: () => iconController.toggleFavoriteColor(index),
                        icon: Icon(
                          isLiked ? Icons.favorite : Icons.favorite_border,
                          color: isLiked ? Colors.red : Colors.white,
                          size: 30,
                        ),
                      ),
                      Text(
                        "${laporan['like']}",
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 10),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
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
