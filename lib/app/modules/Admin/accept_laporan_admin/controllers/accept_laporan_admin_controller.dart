import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'dart:convert';
import '../../../../data/aduan_provider.dart';

class AcceptLaporanAdminController extends GetxController {
  final AduanProvider aduanProvider = Get.put(AduanProvider());

  var laporanList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLaporan();
    ever(laporanList, (_) {
      fetchLaporan();
    });
  }

  void fetchLaporan() async {
    try {
      final response = await aduanProvider.getAduan();
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        var filteredData = data.where((laporan) => laporan['status'] == 'verified').toList();
        laporanList.value = filteredData.cast<Map<String, dynamic>>();
        if (kDebugMode) {
          print('Data aduan berhasil didapatkan: $filteredData');
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch laporan');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to fetch laporan: $e');
    }
  }
}
