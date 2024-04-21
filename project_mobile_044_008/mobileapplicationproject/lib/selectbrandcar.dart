import 'package:flutter/material.dart';
import 'Select-generation-car.dart'; // ตรวจสอบว่า path นี้ถูกต้อง

void main() {
  runApp(MyApp13());
}

class MyApp13 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ลบปุ่ม debug มุมขวาบน
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 5, 34, 85),
        appBar: AppBar(
          title: Text(''),
          backgroundColor: Color.fromARGB(255, 5, 34, 85),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  padding: EdgeInsets.all(10.0),
                  child: Text(
                    'Select Brand car',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: 20.0),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  children: carImages.map((imagePath) => GestureDetector(
                    onTap: () {
                      if (imagePath == 'assets/Honda-Emblem.png') {
                        // นำทางไปยังหน้า SelectGenerationCar เมื่อกดรูป Honda
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyApp7()),
                        );
                      } else {
                        print('You tapped on $imagePath');
                      }
                    },
                    child: Container(
                      margin: EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Center(
                        child: Image.asset(
                          imagePath,
                          width: 60.0,
                          height: 60.0,
                        ),
                      ),
                    ),
                  )).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

const List<String> carImages = [
  'assets/mg.png',
  'assets/toyota.png',
  'assets/porsche.png',
  'assets/benz.png',
  'assets/Suzuki-Logo-PNG-Transparent.png',
  'assets/bmw_logo_PNG19705.png',
  'assets/R (9).png',
  'assets/Honda-Emblem.png',  // ตรวจสอบชื่อไฟล์รูปภาพว่าตรงกับที่อยู่ใน assets
  'assets/audi.png',
  'assets/hyundai.png',
  'assets/nissan.png',
  'assets/ford.png',
  'assets/chevrolet.png',
  'assets/ferrari.png',
  'assets/mini.png',
  'assets/volvo.png',
  'assets/mitsubishi.png',
  'assets/mazda.png',
  'assets/subaru.png',
];
