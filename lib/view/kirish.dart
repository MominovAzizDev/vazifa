import 'package:flutter/material.dart';
import 'package:ilovam/view/chat.dart';
import 'package:ilovam/view/reset_password.dart';
import 'package:ilovam/view/rotish.dart';

class Kirish extends StatelessWidget {
  const Kirish({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Text(
          "Kirish",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
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
                  Text("E-MAIL:", style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 10),
              TextField(
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
              SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => ResetPassword()),
                  );
                },
                child: Text(
                  "Parolni unutdingizmi?",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              SizedBox(
                width: 400,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Chat()),
                    );
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
                        MaterialPageRoute(builder: (context) => Rotish()),
                      );
                    },
                    child: Text(
                      "Ro’yxatdan o’tish",
                      style: TextStyle(color: Colors.blue),
                    ),
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
