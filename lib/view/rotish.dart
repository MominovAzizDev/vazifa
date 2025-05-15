import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:ilovam/services/auth_service.dart';
import 'package:ilovam/view/chat.dart';
import 'package:ilovam/view/kirish.dart';

class Rotish extends StatelessWidget {
  Rotish({super.key});
  final TextEditingController namesController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController newpasswordController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("RO’YXATDAN O’TISH", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.email_outlined, color: Colors.white),
                  Text(
                    "Ism va Familiya:",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: namesController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "Suxrobjon Tolibov",
                  hintStyle: TextStyle(color: Colors.blueGrey),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.email_outlined, color: Colors.white),
                  Text("E-MAIL:", style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: emailController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "namuna@gmail.com",
                  hintStyle: TextStyle(color: Colors.blueGrey),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.lock_open, color: Colors.white),
                  Text("Parol:", style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: passwordController,
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "password",
                  hintStyle: TextStyle(color: Colors.blueGrey),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "kamida 8 ta belgidan iborat boʻlishi kerak",
                style: TextStyle(color: Colors.blueGrey),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Parolni tasdiqlang:",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                controller: newpasswordController,
                style: TextStyle(color: Colors.white),
                obscureText: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  hintText: "password",
                  hintStyle: TextStyle(color: Colors.blueGrey),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "ikkala parol ham mos kelishi kerak",
                style: TextStyle(color: Colors.blueGrey),
              ),
              SizedBox(height: 20),
              SizedBox(
                width: 400,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () async {
                    User? user = await authService.signUp(
                      emailController.text,
                      passwordController.text,
                    );
                    if (user != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Chat()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            "Ro'yxatdan o'tish xatosi",
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                      );
                    }
                  },
                  child: Text(
                    "Davom etish",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 140,
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                  Text("yoki", style: TextStyle(color: Colors.white)),
                  SizedBox(
                    width: 140,
                    child: Divider(
                      color: Colors.white,
                      thickness: 1,
                      height: 1,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: Colors.white, width: 1),
                  backgroundColor: Colors.black,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/google.png", width: 20),
                    Text(
                      "Continue with Google",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  side: BorderSide(color: Colors.white),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/apple.png", width: 20),
                    Text(
                      "Continue with Apple",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Akkauntingiz yoqmi?",
                    style: TextStyle(color: Colors.blueGrey),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Kirish()),
                      );
                    },
                    child: Text("Kirish", style: TextStyle(color: Colors.blue)),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
