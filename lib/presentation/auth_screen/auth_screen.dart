import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:login_layout/util/screen_provider.dart';
import 'package:provider/provider.dart';

class AuthScreen extends Page {
  static const pageName = 'AuthScreen';
  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this, //기본 셋팅일때는 this
      builder: (context) => const AuthWidget(),
    );
  }
}

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWidgetState();
}

class _AuthWidgetState extends State<AuthWidget> {
  bool isRegister = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final OutlineInputBorder _border = OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.transparent, width: 0),
      borderRadius: BorderRadius.circular(8));

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage('assets/image.gif'),
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: SafeArea(
            child: Form(
              key: _formKey,
              child: ListView(
                reverse: true,
                padding: const EdgeInsets.all(16),
                children: [
                  const SizedBox(height: 16),
                  ButtonBar(
                    children: [
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isRegister = false;
                          });
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                isRegister ? FontWeight.w400 : FontWeight.w600,
                            color: isRegister ? Colors.black45 : Colors.black87,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          setState(() {
                            isRegister = true;
                          });
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight:
                                isRegister ? FontWeight.w600 : FontWeight.w400,
                            color: isRegister ? Colors.black87 : Colors.black45,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  _buildTextFormField('Email Address', _emailController),
                  const SizedBox(height: 8),
                  _buildTextFormField('Passord', _passwordController),
                  AnimatedContainer(
                      curve: Curves.fastOutSlowIn,
                      duration: const Duration(milliseconds: 300),
                      height: isRegister ? 8 : 0),
                  AnimatedContainer(
                    height: isRegister ? 60 : 0,
                    curve: Curves.fastOutSlowIn,
                    duration: const Duration(milliseconds: 300),
                    child: _buildTextFormField(
                        'Confirm Password', _confirmPasswordController),
                  ),
                  const SizedBox(height: 16),
                  TextButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          log('good');
                          //listen:false 버튼을 이용하여 프로바이더를 사용할때는 꼭 이걸 해야함.
                          Provider.of<ScreenNotifier>(context, listen: false)
                              .goToMain();
                        }
                      },
                      style: TextButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          backgroundColor: Colors.white54),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: isRegister
                            ? const Text(
                                'Register',
                                style: TextStyle(color: Colors.black),
                              )
                            : const Text(
                                'Login',
                                style: TextStyle(color: Colors.black),
                              ),
                      )),
                  const SizedBox(height: 16),
                  const Divider(
                    height: 33,
                    color: Colors.white54,
                    thickness: 1,
                  ),
                ].reversed.toList(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container _buildSocialbutton(String imagePath, VoidCallback onpressed) {
    return Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.white),
      child: IconButton(
        onPressed: onpressed,
        icon: Image.asset(imagePath),
      ),
    );
  }

  TextFormField _buildTextFormField(
      String labelText, TextEditingController controller) {
    return TextFormField(
      validator: (text) {
        if (controller != _confirmPasswordController &&
            (text == null || text.isEmpty)) {
          return '입력창이 비어있어요!';
        }

        if (controller == _confirmPasswordController && isRegister) {
          if (controller == _confirmPasswordController &&
              isRegister &&
              (text == null || text.isEmpty)) {
            return '비밀번호 확인부분 다시 입력하세요';
          }
        }
        return null; //null이 정상값
      },
      controller: controller,
      style: const TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        errorStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        errorBorder: _border.copyWith(
          borderSide: const BorderSide(
            color: Colors.black,
            width: 3,
          ),
        ),
        filled: true,
        fillColor: Colors.black45,
        labelText: labelText,
        border: _border,
        enabledBorder: _border,
        focusedBorder: _border,
        labelStyle: const TextStyle(color: Colors.white),
      ),
    );
  }
}
