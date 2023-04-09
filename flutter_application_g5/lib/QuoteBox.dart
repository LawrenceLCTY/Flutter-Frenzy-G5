import 'package:flutter/material.dart';

class QuoteBox extends StatefulWidget {
  final List<String> quotes = [
        "Learn as if you will live forever, live like you will die tomorrow.",
        "The only way to do great work is to love what you do.",
        "Life goes on.",
        "The greatest glory in living lies not in never falling, but in rising every time we fall.",
        "Believe you can and you're halfway there.",
        "Opportunities don't happen, you create them.",
        "Love your family, work super hard, live your passion.",
        "It is never too late to be what you might have been.",
        "Success is getting what you want, happiness is wanting what you get.",
        "Don't let yesterday take up too much of today."
      ];


  @override
  _QuoteBoxState createState() => _QuoteBoxState();
}

class _QuoteBoxState extends State<QuoteBox> {
  int _currentIndex = 0;

  void _nextQuote() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % widget.quotes.length;
    });
  }

  void _previousQuote() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % widget.quotes.length;
      if (_currentIndex < 0) {
        _currentIndex = widget.quotes.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Quotes of the day',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            //appBar: AppBar(title: Text("Quotes of the day")),
            body: Center(
          child: Container(
            width: 500,
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(colors: [Colors.blue, Colors.purple])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.quotes[_currentIndex],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _previousQuote,
                        child: Text('Previous'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red), // Set button color to red
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(
                                fontSize: 20,
                                color: Colors.white), // Set font color to white
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _nextQuote,
                        child: Text('Next'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.green), // Set button color to green
                          textStyle: MaterialStateProperty.all<TextStyle>(
                            TextStyle(
                                fontSize: 20,
                                color: Colors.white), // Set font color to white
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(18.0),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ],
            ),
          ),
        )));
  }
}
