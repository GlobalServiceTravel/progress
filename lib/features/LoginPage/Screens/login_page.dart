import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress/features/HomePage/Screens/home_page.dart';
import '../../CommonElements/common_button.dart';
import '../Controller/employee_datacontroller.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final TextEditingController phoneNumnberController =
        TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 6, 0),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 20,
            width: double.infinity,
          ),
          Image.asset(
            "assets/ghfmun_logo.png",
            height: size.height * 0.25,
          ),
          const SizedBox(
            height: 50,
          ),
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
          const SizedBox(
            height: 10,
          ),
          elevatedButton("Login In", () {
            phoneNumnberController.clear();
            passwordController.clear();
            ref.read(employeeDataControllerProvider).employeeDataController();

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const HomePage(),
              ),
            );
          }),
        ],
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
