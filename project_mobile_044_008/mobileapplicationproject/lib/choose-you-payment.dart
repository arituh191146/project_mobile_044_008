import 'package:flutter/material.dart';
import 'mastercart.dart';

void main() {
  runApp(MyApp3());
}

class MyApp3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ลบปุ่ม debug มุมขวาบน
      home: Scaffold(
        appBar: AppBar(
          title: Text('Choose Payment Method'),
        ),
        body: Container(
          color: const Color.fromARGB(255, 5, 34, 85),
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: double.infinity,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'CHOOSE YOUR PAYMENT',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp4()), // ใส่ Widget หน้าที่ต้องการเชื่อมไป
                      );
                      // Handle Master Card button press
                      print('Master Card button pressed');
                    },
                    child: PaymentOption(
                      image: 'assets/mastercard_logo.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle PromptPay button press
                      print('PromptPay button pressed');
                    },
                    child: PaymentOption(
                      image: 'assets/promptpay.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle SCB button press
                      print('SCB button pressed');
                    },
                    child: PaymentOption(
                      image: 'assets/scb.png',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      // Handle True Money button press
                      print('True Money button pressed');
                    },
                    child: PaymentOption(
                      image: 'assets/truemoney.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle KBank button press
                      print('KBank button pressed');
                    },
                    child: PaymentOption(
                      image: 'assets/kbank.png',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // Handle Krungthai button press
                      print('Krungthai button pressed');
                    },
                    child: PaymentOption(
                      image: 'assets/krungthai.png',
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

class PaymentOption extends StatelessWidget {
  final String image;

  PaymentOption({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Image.asset(
        image,
        width: 80,
        height: 80,
      ),
    );
  }
}
//1