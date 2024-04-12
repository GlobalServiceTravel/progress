import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:progress/features/working_with_node/LoginPage/Screens/login_page.dart';
import '../../CommonElements/common_button.dart';
import '../Controller/register_controller.dart';

class SignUpPage extends ConsumerWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final size = MediaQuery.of(context).size;
    final TextEditingController fullNameController = TextEditingController();
    final TextEditingController dateOfBirthController = TextEditingController();
    final TextEditingController genderController = TextEditingController();
    final TextEditingController phoneNumnberController =
        TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController departmentController = TextEditingController();
    final TextEditingController shortIntroController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return SafeArea(
        child: Scaffold(
      backgroundColor: const Color.fromARGB(255, 12, 6, 0),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 20,
              width: double.infinity,
            ),
            Image.asset(
              "assets/ghfmun_logo.png",
              height: size.height * 0.1,
            ),
            const SizedBox(height: 50),
            Text(
              ' Sign Up',
              style: GoogleFonts.aladin(
                textStyle: const TextStyle(
                  color: Colors.white,
                  letterSpacing: .5,
                  fontSize: 45,
                ),
              ),
            ),
            const SizedBox(height: 20),
            textField("Full Name", fullNameController),
            textField("Date of Birth", dateOfBirthController),
            textField("Gender", genderController),
            textField("Phone Number", phoneNumnberController),
            textField("Email", emailController),
            textField("Department", departmentController),
            textField("Short Introduction", shortIntroController),
            textField("password", passwordController),
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
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                      child: const Text(
                        "Already have an Account",
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            ),
            const SizedBox(height: 10),
            elevatedButton("Sign Up", () async {
              final dataProvider = ref.read(
                registerControllerProvider(Tuple8(
                  fullNameController.text,
                  dateOfBirthController.text,
                  genderController.text,
                  phoneNumnberController.text,
                  emailController.text,
                  departmentController.text,
                  shortIntroController.text,
                  passwordController.text,
                )),
              );

               if(dataProvider.isSuccess  ) {
                
               }   


              fullNameController.clear();
              dateOfBirthController.clear();
              genderController.clear();
              phoneNumnberController.clear();
              emailController.clear();
              departmentController.clear();
              shortIntroController.clear();
              passwordController.clear();
            }),
            const SizedBox(
              height: 50,
            )
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
