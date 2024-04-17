import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress/features/working_with_node/SignUp/screens/sign_up_screen.dart';
import 'package:progress/features/working_with_node/HomePage/Screens/home_page.dart';
import '../Controller/employee_datacontroller.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final TextEditingController phoneNumnberController =
        TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    ref.watch(
      employeeDataControllerProvider(
        Tuple2(
          phoneNumnberController.value.text,
          passwordController.value.text,
        ),
      ),
    );

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 6, 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20, width: double.infinity),
            Image.asset(
              "assets/ghfmun_logo.png",
              height: size.height * 0.25,
            ),
            const SizedBox(height: 50),
            Text(
              ' Login',
              style: GoogleFonts.aladin(
                textStyle: const TextStyle(
                  color: Colors.white,
                  letterSpacing: .5,
                  fontSize: 45,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            textField("Enter Phone Number", phoneNumnberController),
            textField("Enter Password", passwordController),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpPage(),
                        ),
                      );
                    },
                    child: const Text(
                      "Create a New Account",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                final loginProvider = ref.watch(
                  employeeDataControllerProvider(
                    Tuple2(
                      phoneNumnberController.value.text,
                      passwordController.value.text,
                    ),
                  ),
                );
                print(phoneNumnberController.value.text);
                print(loginProvider.isSuccess);
                if (loginProvider.isSuccess) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage(
                        password: passwordController.value.text.toString(),
                        phoneNumber: phoneNumnberController.value.text.toString(),
                      ),
                    ),
                  );
                }
              },
              child: const Text('login'),
              // child: loginProvider.isLoading
              //     ? const CircularProgressIndicator()
              //     : loginProvider.isSuccess
              //         ? const Text("Done")
              //         : const Text("login"),
            ),
          ],
        ),
      ),
    ));
  }

  Padding textField(String hintText, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 10),
      child: TextField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          fillColor: Colors.white,
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 109, 107, 107)),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: const BorderSide(color: Colors.grey),
          ),
        ),
      ),
    );
  }
}
