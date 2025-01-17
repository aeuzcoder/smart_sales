import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smart_sale_boss/presentation/controllers/login_controller.dart';
import 'package:smart_sale_boss/presentation/pages/main_page/main_page.dart';
import 'package:smart_sale_boss/presentation/widgets/custom_button.dart';
import 'package:smart_sale_boss/presentation/widgets/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final loginCtr = TextEditingController();
  final passwordCtr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(builder: (controller) {
      return Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.only(
              left: 20, right: 20, top: MediaQuery.viewPaddingOf(context).top),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 36),
                  Container(
                    height: 88,
                    width: 88,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(44),
                      gradient: const LinearGradient(colors: [
                        Color(0xFF7947F8),
                        Color(0xFF936DFF),
                      ]),
                    ),
                    child: const Icon(
                      CupertinoIcons.person_fill,
                      size: 45,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Dasturga kirish',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text(
                      'Dasturda harakatni davom etirish uchun login va parolni kiriting',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  const SizedBox(height: 34),
                  _textFieldBody(
                    title: 'Login',
                    child: CustomTextField(
                      controller: loginCtr,
                      hintText: 'Shu yerga kiritng',
                    ),
                  ),
                  const SizedBox(height: 20),
                  _textFieldBody(
                    title: 'Parol',
                    child: CustomTextField(
                      controller: passwordCtr,
                      hintText: 'Shu yerga kiritng',
                      obscureText: controller.obscureText,
                      onSuffixIcons: controller.onChangeObscure,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(20)
              .copyWith(bottom: MediaQuery.viewPaddingOf(context).bottom + 20),
          child: CustomButton(
            isLoading: controller.isLoading,
            title: 'Dasturga kirish',
            onTap: () async {
              if (_formKey.currentState!.validate()) {
                String login = loginCtr.text.trim();
                String password = passwordCtr.text.trim();
                final res = await controller.onLogin(login, password);
                if (res) Get.off(const MainPage());
              }
            },
          ),
        ),
      );
    });
  }

  Widget _textFieldBody({required String title, required Widget child}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400)),
        const SizedBox(height: 5),
        child,
      ],
    );
  }
}
