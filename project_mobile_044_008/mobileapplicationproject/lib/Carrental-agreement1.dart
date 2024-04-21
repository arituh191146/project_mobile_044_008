import 'package:flutter/material.dart';
import 'car_rental_agreement_page2.dart'; // Adjusted file name for consistency

void main() {
  runApp(MyApp99());
}

class MyApp99 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // บรรทัดนี้จะปิด DEBUG มุมซ้ายบน
      home: CarRentalAgreementPage1(), // Use CarRentalAgreementPage1 as the starting point
    );
  }
}

class CarRentalAgreementPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Car Rental Agreement PAGE1')), // ใช้ Center widget รอบ Text widget
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // เมื่อกดปุ่มนี้จะทำการย้อนกลับไปหน้าที่แล้ว
          },
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
             colors: [const Color.fromARGB(255, 5, 34, 85), const Color.fromARGB(255, 5, 34, 85)], // เปลี่ยนสี Gradient
            end: Alignment.bottomCenter,
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
                    'assets/123.png', // ต้องแทนที่ด้วยที่อยู่ของรูปภาพของคุณ
                    width: 500, // ปรับขนาดรูปภาพตามความต้องการ
                    height: 700, // ปรับขนาดรูปภาพตามความต้องการ
                  ),
                  SizedBox(height: 20), // เพิ่มระยะห่างระหว่างรูปภาพกับปุ่ม
                  ElevatedButton(
                    onPressed: () {
                      // เชื่อมหน้าไปยังหน้าต่อไป
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => CarRentalAgreementPage2()), // ใส่ Widget หน้าที่ต้องการเชื่อมไป
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