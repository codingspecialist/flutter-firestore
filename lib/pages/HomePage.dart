import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class HomePage extends StatelessWidget {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void login() async {
    UserCredential credential = await auth.signInWithEmailAndPassword(
        email: "ssar@nate.com", password: "123456");
    print(credential.user!.email); // 플러터2.0 null 처리 방법
  }

  void join() async {
    // 회원가입 로직
    // (1) 이메일과 패스워드는 Authentication에 저장
    // (2) 전화번호, 나이, 소속부대, 계급 -> Firestore

    // (1)
    UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: "hello@nate.com", password: "123456");
    // 파이어 스토어에도 같이 저장을 해줘야 한다. 그래야 유저 관리를 할 수 있다.
    print(credential.user!.email);

    // (2) 이 부분 완성
  }

  @override
  Widget build(BuildContext context) {
    login();
    join();
    return Scaffold(
      body: Center(
        child: Text("HomePage"),
      ),
    );
  }
}
