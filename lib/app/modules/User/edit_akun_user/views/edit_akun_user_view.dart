import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sp_util/sp_util.dart';
import '../controllers/edit_akun_user_controller.dart';

class EditAkunUserView extends StatelessWidget {
  final EditAkunUserController controller = Get.put(EditAkunUserController());

  EditAkunUserView({Key? key}) : super(key: key) {
    controller.usernameController.text = SpUtil.getString('username') ?? '';
    controller.phoneNumberController.text = SpUtil.getString('phone_number') ?? '';
    controller.addressController.text = SpUtil.getString('address') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'EditAkunUserView',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color.fromRGBO(29, 53, 87, 1),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text("Silahkan Lengkapi Data Berikut ini"),
              const SizedBox(height: 10),
              const Align(
                alignment: Alignment.topLeft,
                child: Text("Username"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.usernameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(width: 20)),
                  label: Text("Username"),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text("Phone Number"),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: controller.phoneNumberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  label: Text("Phone Number"),
                ),
              ),
              const Align(
                alignment: Alignment.topLeft,
                child: Text("Address"),
              ),
              const SizedBox(height: 5),
              TextField(
                controller: controller.addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
                  label: Text("Address"),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(height: 15),
              Align(
                alignment: Alignment.centerRight,
                child: FractionallySizedBox(
                  widthFactor: 0.5,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF1D3557),
                    ),
                    onPressed: () {
                      controller.updateAkun();
                    },
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Simpan",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
