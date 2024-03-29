import 'package:flutter/material.dart';

// main function, runs App starting at Hello World Route
void main() {
  runApp(const MaterialApp(
    title: 'Hello Flutter App!',
    home: HelloRoute(),
  ));
}

// Super simple route, no state
class HelloRoute extends StatelessWidget {
  const HelloRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello World!'),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text('Continue...'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ColorSwitcher()),
            );
          },
        ),
      ),
    );
  }
}

// ColorSwitcher Route, slightly more complex that Hello World Route
class ColorSwitcher extends StatefulWidget {
  @override
  _ColorSwitcherState createState() => _ColorSwitcherState();
}

class _ColorSwitcherState extends State<ColorSwitcher> {
  Color _backgroundColor = Colors.white;
  String _nextColor = "Switch to Black"; // this will dynamically update with toggle

  void _changeColor() {
    setState(() {
      _backgroundColor = _backgroundColor == Colors.white ? Colors.black : Colors.white; // Simple toggle
      _nextColor = _nextColor == "Switch to Black" ? "Switch to White" : "Switch to Black";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Color Switcher'),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: _changeColor,
            child: Text(
              _nextColor, 
              style: TextStyle(fontSize: 20),
            ),
          ),
        ),
      ),
    );
  }
}
