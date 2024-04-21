import 'package:flutter/material.dart';

void main() {
  runApp(Civic2019Page());
}

class Civic2019Page extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ViewDetailCar(),
    );
  }
}

class ViewDetailCar extends StatefulWidget {
  @override
  _ViewDetailCarState createState() => _ViewDetailCarState();
}

class _ViewDetailCarState extends State<ViewDetailCar> {
  int _currentIndex = 0;

  final List<String> _carImages = [
    'assets/hondacivic--.png',
    'assets/Honda-Civic-PNG-Photo.png',
    'assets/honda12.png',
    'assets/honda13.png',
    'assets/honda.png',
    // 'assets/car6.jpg',
    // 'assets/car7.jpg',
  ];

  void _nextImage() {
    setState(() {
      if (_currentIndex < _carImages.length - 1) {
        _currentIndex++;
      } else {
        _currentIndex = 0;
      }
    });
  }

  void _prevImage() {
    setState(() {
      if (_currentIndex > 0) {
        _currentIndex--;
      } else {
        _currentIndex = _carImages.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Detail Car'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: _nextImage,
              onHorizontalDragEnd: (DragEndDetails details) {
                if (details.primaryVelocity! > 0) {
                  _prevImage();
                } else if (details.primaryVelocity! < 0) {
                  _nextImage();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.white, Colors.lightBlueAccent],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
                margin: EdgeInsets.symmetric(horizontal: 10),
                child: Image.asset(
                  _carImages[_currentIndex],
                  fit: BoxFit.contain, // ให้รูปภาพขนาดเล็กลง
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Center(
            child: Text(
              'Honda Civic 2019(FC)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: _prevImage,
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward),
              onPressed: _nextImage,
            ),
          ],
        ),
      ),
    );
  }
}
