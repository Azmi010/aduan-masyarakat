import 'package:aduan/app/routes/app_pages.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      extendBody: true,
      backgroundColor: const Color.fromARGB(255, 2, 57, 102),
      body: Container(
        margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.15),
        child: Align(
          alignment: Alignment.topCenter,
          child: Image.asset(
            'assets/images/logo.png',
            width: 80,
            height: 80,
          ),
        ),
      ),
      bottomSheet: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          return ConstrainedBox(
            constraints: BoxConstraints(
              maxHeight: constraints.maxHeight * 0.65,
            ),
            child: SingleChildScrollView(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 241, 250, 238),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 10,
                      offset: Offset(0, -5),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 30),
                            Container(
                              margin: const EdgeInsets.only(left: 25),
                              child: const Text(
                                'Email Address',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              margin: const EdgeInsets.only(left: 20, right: 20),
                              child: TextField(
                                controller: controller.emailtxt,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan alamat email',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            Container(
                              margin: const EdgeInsets.only(left: 25),
                              child: const Text(
                                'Password',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                                textAlign: TextAlign.left,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              margin: const EdgeInsets.only(left: 20, right: 20),
                              child: TextField(
                                controller: controller.passwordtxt,
                                obscureText: true,
                                decoration: InputDecoration(
                                  hintText: 'Masukkan password',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(right: 25),
                                child: GestureDetector(
                                    onTap: () {
                                      Get.toNamed(Routes.RESET_PASSWORD);
                                    },
                                    child: const Text("Lupa password?")))
                          ],
                        ),
                        const SizedBox(height: 20),
                        ElevatedButton(
                          onPressed: () {
                            controller.auth();
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(255, 2, 57, 102),
                              fixedSize: Size(
                                  MediaQuery.of(context).size.width * 0.9, 50),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20))),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),
                        RichText(
                          text: TextSpan(
                            text: 'Apakah belum memiliki akun?',
                            style: const TextStyle(
                              color: Color.fromARGB(255, 29, 53, 87),
                              fontSize: 16,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: ' Register',
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 2, 57, 102),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(Routes.REGISTER);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: RichText(
                        text: const TextSpan(
                          children: [
                            TextSpan(
                              text: 'J-Care',
                              style: TextStyle(
                                color: Color.fromARGB(255, 29, 53, 87),
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: ' created by Success Team',
                              style: TextStyle(
                                color: Color.fromARGB(255, 29, 53, 87),
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
