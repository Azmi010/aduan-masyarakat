import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import 'dart:convert';
import '../../../../data/aduan_provider.dart';

class SemuaLaporanUserController extends GetxController {
  final AduanProvider aduanProvider = Get.put(AduanProvider());

  var laporanList = <Map<String, dynamic>>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchLaporan();
  }

  void fetchLaporan() async {
    try {
      final response = await aduanProvider.getAduan();
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        var filteredData = data.where((laporan) => laporan['status'] == 'pending').toList();
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
  
  void toggleFavoriteColor(int index) async {
    final token = SpUtil.getString('access_token') ?? '';
    if (token.isEmpty) {
      Get.snackbar('Error', 'Invalid or missing token');
      return;
    }

    var laporan = laporanList[index];
    bool isLiked = laporan['liked'] ?? false;
    int newLikeCount = isLiked ? (laporan['like'] ?? 0) - 1 : (laporan['like'] ?? 0) + 1;

    try {
      final response = await aduanProvider.updateLike(
        laporan['id'],
        newLikeCount,
        token,
        !isLiked,
      );
      if (response.statusCode == 200) {
        laporanList[index] = {
          ...laporan,
          'like': newLikeCount,
          'liked': !isLiked,
        };
        laporanList.refresh();
      } else {
        Get.snackbar('Error', 'Failed to update like');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to update like: $e');
    }
  }

  void updateStatus(int aduanId, String newStatus) async {
  final token = SpUtil.getString('access_token') ?? '';
  if (token.isEmpty) {
    Get.snackbar('Error', 'Invalid or missing token');
    return;
  }

  try {
    final response = await aduanProvider.updateStatus(aduanId, newStatus, token);
    if (response.statusCode == 200) {
      fetchLaporan(); 
      Get.back(); 
    } else {
      Get.snackbar('Error', 'Failed to update status');
    }
  } catch (e) {
    Get.snackbar('Error', 'Failed to update status: $e');
  }
}

}
