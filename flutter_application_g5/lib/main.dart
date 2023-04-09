import 'package:flutter/material.dart';

class QuoteBox extends StatefulWidget {
  final List<String> quotes;

  QuoteBox({required this.quotes});

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

void main() {
  runApp(MaterialApp(
    home: QuoteBox(
      quotes: [
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
      ],
    ),
  ));
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug painting" (press "p" in the console, choose the
          // "Toggle Debug Paint" action from the Flutter Inspector in Android
          // Studio, or the "Toggle Debug Paint" command in Visual Studio Code)
          // to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
