import 'package:flutter/material.dart';
import 'package:flutter_factory/Layouts/index.dart';
import 'package:get/get.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';
  String address = '';
  String nickname = '';

  @override
  Widget build(BuildContext context) {
    return DefaultAppbarLayout(
      title: 'Form Input',
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                renderTextFormField(
                  label: '이름',
                  onSaved: (val) {
                    setState(() {
                      name = val;
                    });
                  },
                  validator: (val) {
                    if (val.length < 1) {
                      return '이름은 필수사항입니다.';
                    }

                    if (val.length < 2) {
                      return '이름은 두글자 이상 입력 해주셔야합니다.';
                    }

                    return null;
                  },
                ),
                renderTextFormField(
                  label: '이메일',
                  onSaved: (val) {
                    setState(() {
                      email = val;
                    });
                  },
                  validator: (val) {
                    if (val.length < 1) {
                      return '이메일은 필수사항입니다.';
                    }

                    if (!RegExp(
                            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                        .hasMatch(val)) {
                      return '잘못된 이메일 형식입니다.';
                    }
                    return null;
                  },
                ),
                renderTextFormField(
                  label: '비밀번호',
                  isObscureText: true,
                  onSaved: (val) {
                    setState(() {
                      password = val;
                    });
                  },
                  validator: (val) {
                    if (val.length < 1) {
                      return '비밀번호는 필수사항입니다.';
                    }

                    if (val.length < 8) {
                      return '8자 이상 입력해주세요!';
                    }
                    return null;
                  },
                ),
                renderTextFormField(
                  label: '주소',
                  onSaved: (val) {
                    setState(() {
                      address = val;
                    });
                  },
                  validator: (val) {
                    if (val.length < 1) {
                      return '주소는 필수사항입니다.';
                    }
                    return null;
                  },
                ),
                renderTextFormField(
                  label: '닉네임',
                  onSaved: (val) {
                    setState(() {
                      nickname = val;
                    });
                  },
                  validator: (val) {
                    if (val.length < 1) {
                      return '닉네임은 필수사항입니다.';
                    }
                    if (val.length < 8) {
                      return '닉네임은 8자 이상 입력해주세요!';
                    }
                    return null;
                  },
                ),
                renderButton(),
                renderValues(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  renderButton() {
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          // validation 이 성공하면 true 가 리턴돼요!

          // validation 이 성공하면 폼 저장하기
          formKey.currentState!.save();

          Get.snackbar(
            '저장완료!',
            '폼 저장이 완료되었습니다!',
            backgroundColor: Colors.green.shade200,
            snackPosition: SnackPosition.TOP,
            forwardAnimationCurve: Curves.elasticInOut,
            reverseAnimationCurve: Curves.easeOut,
          );
        } else {
          Get.snackbar(
            '입력값 오류',
            '입력값이 정확한지 확인 바랍니다.',
            backgroundColor: Colors.pinkAccent,
            snackPosition: SnackPosition.TOP,
            forwardAnimationCurve: Curves.elasticInOut,
            reverseAnimationCurve: Curves.easeOut,
          );

          Get.dialog(
            AlertDialog(
              title: const Text('Dialog'),
              content: const Text('This is a dialog'),
              actions: [
                TextButton(
                  child: const Text("Close"),
                  onPressed: () => Get.back(result: false),
                ),
                TextButton(
                  child: const Text("Close and go Back"),
                  onPressed: () => Get.back(closeOverlays: true),
                ),
              ],
            ),
          );
        }
      },
      child: const Text(
        '저장하기!',
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  renderTextFormField({
    required String label,
    required FormFieldSetter onSaved,
    required FormFieldValidator validator,
    bool isObscureText = false,
  }) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.always,
              obscureText: isObscureText,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter a search term',
              ),
              onSaved: onSaved,
              validator: validator,
            ),
            const SizedBox(
              height: 4,
            ),
          ],
        ),
      ),
    );
  }

  renderValues() {
    return Column(
      children: [
        Text('name: $name'),
        Text('email: $email'),
        Text(
          'password: $password',
        ),
        Text(
          'address: $address',
        ),
        Text(
          'nickname: $nickname',
        ),
      ],
    );
  }
}
