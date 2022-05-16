import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:motive_complete/Goal/settingpage.dart';

import '../Goal/py1.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //파이어베이스 시작
  final _authentication = FirebaseAuth.instance;
  // bool isSignupscreen = true;
  final _formKey = GlobalKey<FormState>();
  String userEmail = '';
  String userPassword = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          key: _formKey,
          children: <Widget>[
            const Text(
              '회원가입',
              style: TextStyle(fontSize: 41, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 120.0),
            Column(
              children: [
                //이메일 입력
                TextFormField(
                  key: const ValueKey(1),
                  validator: (value) {
                    if (value!.isEmpty || value.length < 4) {
                      return "Please enter at least 4 characters";
                    }
                    return null;
                  },
                  onSaved: (value) async {
                    userEmail = value!;
                  },
                  onChanged: (value) {
                    userEmail = value;
                  },
                  decoration: const InputDecoration(
                    filled: true,
                    labelText: '이메일',
                    hintText: '이메일을 입력해주세요',
                  ),
                  // onChanged: (value){
                  //   userEmail = value;
                  // },
                ),
              ],
            ),
            const SizedBox(height: 12.0),
            //비밀번호 입력
            TextFormField(
              key: const ValueKey(2),
              validator: (value) {
                if (value!.isEmpty) {
                  return "enter pw";
                }
                return null;
              },
              onSaved: (value) {
                userPassword = value!;
              },
              onChanged: (value) {
                userPassword = value;
              },
              decoration: const InputDecoration(
                filled: true,
                labelText: '비밀번호',
                hintText: '비밀번호를 입력해주세요',
              ),
            ),
            //확인 버튼
            RaisedButton(
                child: const Text('다음'),
                textColor: Colors.white,
                color: Colors.indigo,
                onPressed: () async {
                  // _tryValidation();
                  print(userEmail);
                  print(userPassword);
                  try {
                    final newUser =
                        await _authentication.createUserWithEmailAndPassword(
                            email: userEmail, password: userPassword);
                    if (newUser.user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => (nameinput())),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                }),
          ],
        ),
      ),
    );
  }
}
