import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/semua_laporan_user_controller.dart';

class SemuaLaporanUserView extends GetView<SemuaLaporanUserController> {
  const SemuaLaporanUserView({super.key});

  @override
  Widget build(BuildContext context) {
    // Dummy data
    final List<Map<String, String>> laporanData = [
      {
        'judul': 'Laporan 1',
        'gambar':
            'https://w0.peakpx.com/wallpaper/149/258/HD-wallpaper-dark-vertical-portrait-display.jpg',
        'subtitle': 'Subtitle 1',
        'lokasi': 'Lokasi 1',
        'deskripsi':
            'Lorem ipsum dolor sit, amet consectetur adipisicing elit. Perferendis impedit dolores eveniet odio ad omnis adipisci iusto praesentium odit at id, quod quibusdam vitae accusamus modi similique nulla atque, est ipsam quia! Unde animi at, iste nihil amet architecto. Ex tempore distinctio, ratione quis labore itaque accusamus quisquam magni ad.',
        'username': 'user1',
        'time': '2h',
      },
      {
        'judul': 'Laporan 2',
        'gambar': 'https://via.placeholder.com/150',
        'subtitle': 'Subtitle 2',
        'lokasi': 'Lokasi 2',
        'deskripsi': 'Deskripsi laporan 2',
        'username': 'user2',
        'time': '4h',
      },
      {
        'judul': 'Laporan 3',
        'gambar': 'https://via.placeholder.com/150',
        'subtitle': 'Subtitle 3',
        'lokasi': 'Lokasi 3',
        'deskripsi': 'Deskripsi laporan 3',
        'username': 'user3',
        'time': '1d',
      },
      {
        'judul': 'Laporan 4',
        'gambar': 'https://via.placeholder.com/150',
        'subtitle': 'Subtitle 4',
        'lokasi': 'Lokasi 4',
        'deskripsi': 'Deskripsi laporan 4',
        'username': 'user4',
        'time': '2d',
      },
      {
        'judul': 'Laporan 5',
        'gambar': 'https://via.placeholder.com/150',
        'subtitle': 'Subtitle 5',
        'lokasi': 'Lokasi 5',
        'deskripsi': 'Deskripsi laporan 5',
        'username': 'user5',
        'time': '3d',
      },
    ];

    final SemuaLaporanUserController iconController =
        Get.put(SemuaLaporanUserController());

    return Scaffold(
      body: PageView.builder(
        itemCount: laporanData.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          final laporan = laporanData[index];
          return Stack(
            children: [
              Positioned.fill(
                child: Image.network(
                  laporan['gambar']!,
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
                        laporan['username']!,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                    Text(
                      laporan['judul']!,
                      style: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0),
                      child: Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '${laporan['deskripsi']}',
                              style: const TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        laporan['time']!,
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
                    Obx(() => IconButton(
                          onPressed: iconController.toggleFavoriteColor,
                          icon: Icon(
                            Icons.favorite,
                            color: iconController.favoriteColor.value,
                            size: 30,
                          ),
                        )),
                    Obx(
                      () => Text(
                        "${iconController.count.value}",
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Obx(() => IconButton(
                          onPressed: iconController.toggleSendColor,
                          icon: Icon(
                            Icons.send,
                            color: iconController.sendColor.value,
                            size: 30,
                          ),
                        )),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
