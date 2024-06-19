import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app_kag/provider/auth_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Consumer<AuthProvider>(
        builder: (context, value, child) => Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.2,
                  ),
                  // Container(
                  //   alignment: Alignment.center,
                  //   width: MediaQuery.of(context).size.width,
                  //   child: Image.asset(
                  //     'assets/logo.png', // Ubah sesuai dengan path aset yang digunakan
                  //     width: MediaQuery.of(context).size.width * 0.6,
                  //   ),
                  // ),
                  const Text(
                    "Inventory Application",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Email",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    controller: value.ctrlEmail,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      hintText: "Enter your email",
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text(
                      "Password",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  TextFormField(
                    controller: value.ctrlPassword,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    // obscureText: !controller.isShowPw.value,
                    onChanged: (value) {},
                    decoration: InputDecoration(
                      // suffixIcon: IconButton(
                      // onPressed: () {
                      // controller.showPassword();
                      // },
                      // icon: controller.isShowPw.value
                      //     ? const Icon(Icons.visibility_off, color: Colors.grey)
                      //     : const Icon(Icons.visibility, color: Colors.grey),
                      // ),
                      hintText: "Enter your password",
                      fillColor: Colors.grey[200],
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: InkWell(
                      onTap: () {
                        // Get.bottomSheet(
                        // SheetsForgotPassword(),
                        // isScrollControlled: true,
                        // );
                      },
                      child: const Text(
                        "Forgot password?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      value.login(context);
                    },
                    child: Text("Login"),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(fontSize: 12),
                      ),
                      const SizedBox(
                        width: 4,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
