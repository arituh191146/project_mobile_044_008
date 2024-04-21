import 'package:flutter/material.dart';
import 'information.dart';

void main() {
  runApp(MyApp4());
}

class MyApp4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // ลบปุ่ม debug มุมขวาบน
      title: 'MasterCard',
      home: Scaffold(
        appBar: AppBar(
          title: Text('MasterCard'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [const Color.fromARGB(255, 5, 34, 85), const Color.fromARGB(255, 5, 34, 85)], // เปลี่ยนสี Gradient
                end: Alignment.bottomCenter,
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/mastercard_logo.png', // ตั้งค่า path ของรูปรถ
                    height: 300, // ปรับขนาดรูปรถตามต้องการ
                    width: 300,
                  ),
                  SizedBox(height: 32),
                  MasterCardForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MasterCardForm extends StatefulWidget {
  @override
  _MasterCardFormState createState() => _MasterCardFormState();
}

class _MasterCardFormState extends State<MasterCardForm> {
  final _formKey = GlobalKey<FormState>();
  String? cardholderName;
  String? creditCardNumber;
  String? creditCardExpirationDate;
  String? cvv;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Cardholder Name'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                cardholderName = value;
              });
            },
          ),
          SizedBox(height: 16),
          TextFormField(
            decoration: InputDecoration(labelText: 'Credit Card Number'),
            validator: (value) {
              if (value?.isEmpty ?? true) {
                return 'Please enter some text';
              }
              return null;
            },
            onChanged: (value) {
              setState(() {
                creditCardNumber = value;
              });
            },
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'Credit Card Expiration Date'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                     Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => MyApp5()), // ใส่ Widget หน้าที่ต้องการเชื่อมไป
                      );
                    setState(() {
                      creditCardExpirationDate = value;
                    });
                  },
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: TextFormField(
                  decoration: InputDecoration(labelText: 'CVV'),
                  validator: (value) {
                    if (value?.isEmpty ?? true) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    setState(() {
                      cvv = value;
                    });
                  },
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shadowColor: Colors.blueAccent, // set the background color
            ),
            onPressed: () {
              if (_formKey.currentState?.validate() ?? false) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text('Processing Data')));
              }
            },
            child: Text('Submit'),
          ),
        ],
      ),
    );
  }
}
//1