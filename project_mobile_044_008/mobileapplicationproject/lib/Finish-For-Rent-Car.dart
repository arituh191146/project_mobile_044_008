import 'package:flutter/material.dart';
import 'Log-out.dart'; // Adjusted file name and class name for consistency

void main6() {
  runApp(MyApp6());
}

class MyApp6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(), // Use MainScreen as the starting point
      debugShowCheckedModeBanner: false, // ลบปุ่ม debug มุมขวาบน
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Rent a Car'),
        ),
      ),
      body: Container(
        // แก้ไขส่วนนี้
        decoration: BoxDecoration(
          gradient: LinearGradient(
             colors: [const Color.fromRGBO(0, 11, 50, 1.0), const Color.fromRGBO(0, 11, 50, 1.0)], // เปลี่ยนสี Gradient ตรงนี้
          ),
        ),
        // ส่วนที่เหลือเหมือนเดิม
        child: Center(
          child: Container(
            width: 400,
            height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/Honda-Civic-PNG-Photo.png',
                  width: 200,
                  height: 200,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Finish for Rent Car ',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.check_circle, color: Colors.green),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'You choose : Honda Civic 2019',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 10),
                Text(
                  'Thank you!!!',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Navigate to logout screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LogoutPage()),
                        ).then((value) {
                          // Handle the response from logout screen
                          if (value == true) {
                            // User chose to logout
                            // Perform logout actions if needed
                          } else {
                            // User chose not to logout
                            // Perform actions accordingly
                          }
                        });
                      },
                      child: Text('Next'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
//1