import 'package:flutter/material.dart';
import 'login.dart';

class LogoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        
        title: Text('Logout'),
      ),
      body: Center(
        child: Container(
          width: 300,
          height: 200,
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 15, 44, 67),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 2),
                blurRadius: 6.0,
              ),
            ],
          ),
          child: Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 15, 44, 67),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  'Do you want to log out?',
                  style: TextStyle(
                    fontSize: 18,
                    color: const Color.fromARGB(255, 247, 246, 246),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Handle No button action
                        Navigator.pop(context, false); // Return false when 'No' is selected
                      },
                      child: Text('Yes'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Login()), // ใส่ Widget หน้าที่ต้องการเชื่อมไป
                      );
                        // Handle Yes button action
                        Navigator.pop(context, true); // Return true when 'Yes' is selected
                      },
                      
                      child: Text('No'),
                      
                      
                      
                      
                      
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