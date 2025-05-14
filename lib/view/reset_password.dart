import 'package:flutter/material.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text("Parolni tiklash", style: TextStyle(color: Colors.white)),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: 40),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20, left: 20),
                child: Image.asset("assets/icons/27.png", width: 300),
              ),
              Text(
                "Parolni tiklash uchun ro’yxatdan",
                style: TextStyle(color: Colors.white),
              ),
              Text(
                "o’tgan elektron pochtangizni kiriting",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(height: 50),
              Row(
                children: [
                  Icon(Icons.mail_outline, color: Colors.white),
                  Text("E-MAIL:", style: TextStyle(color: Colors.white)),
                ],
              ),
              SizedBox(height: 10),
              TextField(
                decoration: InputDecoration(
                  hintText: "arashov@gmail.com",
                  hintStyle: TextStyle(color: Colors.white),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              SizedBox(height: 50),
              SizedBox(
                width: 300,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                  onPressed: () {},
                  child: Text(
                    "Davom etish",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
