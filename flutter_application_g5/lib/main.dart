import 'package:flutter/material.dart';

 
void main() {

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        colorScheme: ColorScheme.light(primary: Color.fromARGB(99, 155, 21, 21))
      ),
    home: HomePage()
    )
  );
}

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
    return Scaffold(
            body: Center(
          child: Container(
            width: 500,
            height: 150,
            decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                    colors: [Colors.blueAccent, Colors.purpleAccent])),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Quotes of the day',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white),
                ),
                SizedBox(height: 10),
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
        ));
  }
}

class WaterTracker extends StatefulWidget {
  @override
  _WaterTrackerState createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  int _glassesDrunk = 0;
  bool _showMessage = false;
  bool _showMessage2 = false;

  void _resetGlasses() {
    setState(() {
      _glassesDrunk = 0;
      _showMessage = false;
      _showMessage2=false;
    });
  }

  void _drinkWater() {
    setState(() {
      if (_glassesDrunk < 7) {
        _glassesDrunk++;
      }
      if (_glassesDrunk==7){
        _showMessage2= true;
      }
      else if (_glassesDrunk == 2) {
        _showMessage = true;
      } 
      else {
        _showMessage = false;
        _showMessage2=false;
      }
    });
  }

  Widget _buildGlass(int index) {
    bool isDrunk = index < _glassesDrunk;
    return GestureDetector(
      onTap: _drinkWater,
      child: Container(
        margin: EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: isDrunk ? Color.fromARGB(255, 2, 46, 83) : Color.fromARGB(255, 161, 210, 249),
          border: Border.all(
            color: Color.fromARGB(255, 10, 56, 95),
            width: 2,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          isDrunk ? Icons.check : Icons.local_drink,
          color: isDrunk ? Colors.white : Color.fromARGB(255, 14, 52, 84),
          size: 32,
        ),
      ),
    );
  }
  Widget _buildMessage() {
    return AnimatedOpacity(
      opacity: _showMessage ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: Text(
        'Keep Going!',
        style: TextStyle(
          fontSize: 24, 
          fontWeight: FontWeight.bold,
          color: Colors.blueGrey,
        ),
        
      ),
    );
  }

  Widget _buildMessage2() {
    return AnimatedOpacity(
      opacity: _showMessage2 ? 1.0 : 0.0,
      duration: Duration(milliseconds: 500),
      child: Text(
        'Well Done!',
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 48, 155, 51),
        ),
        
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Water Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildMessage(),
            _buildMessage2(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildGlass(0),
                _buildGlass(1),
                _buildGlass(2),
                _buildGlass(3),
                _buildGlass(4),
                _buildGlass(5),
                _buildGlass(6),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _resetGlasses,
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}


class HomePage extends StatefulWidget {
  const HomePage({super.key});

 
  @override
  State<HomePage> createState() => _HomePageState();
}

 
class _HomePageState extends State<HomePage> {
final _textController1 = TextEditingController();
final _textController2 = TextEditingController();
final _textController3 = TextEditingController();
final _textController4 = TextEditingController();
final _textController5 = TextEditingController();


 
  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SelfCare App',
      theme: ThemeData(
        primarySwatch: Colors.blue),
      home: Scaffold(
      body: PageView(
        controller: controller,
        children: [
            Center(child: (QuoteBox())),
            Center(child: (WaterTracker())),
            Center(child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
              Text(
              'To Do List:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0,),
            TextField(
              controller: _textController1,
              decoration: InputDecoration(
                hintText: 'Tasks 1',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController1.clear();
                  },
                  icon: const Icon(
                    Icons.clear
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0,),
            TextField(
              controller: _textController2,
              decoration: InputDecoration(
                hintText: 'Tasks 2',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController2.clear();
                  },
                  icon: const Icon(
                    Icons.clear
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0,),
            TextField(
              controller: _textController3,
              decoration: InputDecoration(
                hintText: 'Tasks 3',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController3.clear();
                  },
                  icon: const Icon(
                    Icons.clear
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0,),
            TextField(
              controller: _textController4,
              decoration: InputDecoration(
                hintText: 'Tasks 4',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController4.clear();
                  },
                  icon: const Icon(
                    Icons.clear
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0,),
            TextField(
              controller: _textController5,
              decoration: InputDecoration(
                hintText: 'Tasks 5',
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: () {
                    _textController5.clear();
                  },
                  icon: const Icon(
                    Icons.clear
                  ),
                ),
              ),
            ),
            ]))])));}
}
