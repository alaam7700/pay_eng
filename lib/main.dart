import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  bool _isTapped = false;
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 150),
    );
    _animation = Tween<double>(begin: 1.0, end: 0.9).animate(_controller);
  }

  void _toggleTap() {
    setState(() {
      _isTapped = !_isTapped;
      if (_isTapped) {
        _controller.forward().then((_) {
          Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => ComplaintsPage()),
          );
        });
      } else {
        _controller.reverse();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyanAccent,
        title: Text(
          'alaa mortada',
          style: TextStyle(
            fontSize: 30,
            color: Colors.red,
          ),
        ),
      ),
      body: Center(
        child: GestureDetector(
          onTap: _toggleTap,
          child: ScaleTransition(
            scale: _animation,
            child: Container(
              margin: EdgeInsets.only(
                right: 40,
                left: 40,
                top: 50,
              ),
              width: double.infinity,
              height: 190,
              decoration: BoxDecoration(
                color: Colors.amber,
                border: Border.all(
                  color: Colors.amber, // لون الحدود
                  width: 2.0, // عرض الحدود
                ),
                borderRadius: BorderRadius.circular(40),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    height: 120,
                    width: 120,
                    top: 20,
                    left: 20,
                    child: Image.asset(
                      'image/books.png', // تأكد من صحة المسار
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class ComplaintsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('التظلمات'),
      ),
      body: Center(
        child: const Text('صفحة التظلمات'),
      ),
    );
  }
}
