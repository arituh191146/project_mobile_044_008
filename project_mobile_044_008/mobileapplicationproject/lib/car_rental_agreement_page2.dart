import 'package:flutter/material.dart';
import 'Carrental-agreement3.dart';

class CarRentalAgreementPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Car Rental Agreement PAGE2')), // ใช้ Center widget รอบ Text widget
        backgroundColor: Colors.white,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 5, 34, 85), const Color.fromARGB(255, 5, 34, 85)], // เปลี่ยนสี Gradient
          ),
        ),
        child: Center(
          child: Container(
            width: 350, // ปรับขนาดกล่องตามความต้องการ
            height: 600, // ปรับขนาดกล่องตามความต้องการ
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: SingleChildScrollView( // ใช้ SingleChildScrollView เพื่อปรับความสูงของ Column
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // รูปภาพที่จะใส่ในกล่อง
                  Image.asset(
                    'assets/456.png', // ต้องแทนที่ด้วยที่อยู่ของรูปภาพของคุณ
                    width: 500, // ปรับขนาดรูปภาพตามความต้องการ
                    height: 700, // ปรับขนาดรูปภาพตามความต้องการ
                  ),
                  SizedBox(height: 20), // เพิ่มระยะห่างระหว่างรูปภาพกับปุ่ม
                  ElevatedButton(
                    onPressed: () {
                      // การทำงานเมื่อปุ่มถูกกด
                      print('Next button pressed');
                      // Navigate to MyApp
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp2()),
                      );
                    },
                    child: Text('Next'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//1