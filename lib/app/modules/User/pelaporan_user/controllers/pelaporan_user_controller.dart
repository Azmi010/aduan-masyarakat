import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:sp_util/sp_util.dart';

import '../../../../../global.dart';

class PelaporanUserController extends GetxController {
  var imageFile = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage(ImageSource source) async {
    final XFile? pickedFile = await _picker.pickImage(source: source);
    if (pickedFile != null) {
      imageFile.value = File(pickedFile.path);
    } else {
      Get.snackbar('Error', 'No image selected');
    }
  }

  Future<void> submitAduanData(String judul, String lokasi, String keterangan) async {
    final userId = SpUtil.getInt('id').toString();
    if (imageFile.value == null) {
      Get.snackbar('Error', 'No image selected');
      return;
    }

    var uri = Uri.parse('$baseUrl/api/auth/aduans');
    var request = http.MultipartRequest('POST', uri)
      ..fields['user_id'] = userId
      ..fields['judul'] = judul
      ..fields['lokasi'] = lokasi
      ..fields['keterangan'] = keterangan
      ..fields['like'] = '0'
      ..fields['status'] = 'pending'; 

    request.files.add(await http.MultipartFile.fromPath('gambar', imageFile.value!.path));

    try {
      var response = await request.send();

      if (response.statusCode == 201) {
        Get.snackbar('Success', 'Aduan submitted successfully');
        
      } else {
        Get.snackbar('Error', 'Failed to submit aduan');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to submit aduan: $e');
    }
  }
  
}
