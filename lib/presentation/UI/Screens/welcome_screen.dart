import 'package:flutter/material.dart';
import 'package:intro_slider/intro_slider.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WelcomeScreen(),
    );
  }
}

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<SliderItem> _sliderItems = [
    SliderItem(
      imageUrl: 'assets/image1.png', // Replace with your image assets
      title: 'Welcome to MyApp',
      description: 'This is a sample welcome screen in Flutter.',
    ),
    SliderItem(
      imageUrl: 'assets/image2.png', // Replace with your image assets
      title: 'Explore Features',
      description: 'Discover all the amazing features of our app.',
    ),
    SliderItem(
      imageUrl: 'assets/image3.png', // Replace with your image assets
      title: 'Get Started',
      description: 'Start using our app and enjoy the experience.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            controller: _pageController,
            itemCount: _sliderItems.length,
            onPageChanged: (int index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              return _sliderItems[index];
            },
          ),
          Positioned(
            bottom: 40.0,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildPageIndicator(),
            ),
          ),
          if (_currentPage == _sliderItems.length - 1)
            Positioned(
              bottom: 80.0,
              left: 0,
              right: 0,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button click (e.g., navigate to the next screen)
                },
                child: Text('Get Started'),
              ),
            ),
        ],
      ),
    );
  }

  List<Widget> _buildPageIndicator() {
    List<Widget> indicators = [];
    for (int i = 0; i < _sliderItems.length; i++) {
      indicators.add(
        Container(
          width: 10.0,
          height: 10.0,
          margin: EdgeInsets.symmetric(horizontal: 6.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentPage == i ? Colors.blue : Colors.grey,
          ),
        ),
      );
    }
    return indicators;
  }
}

class SliderItem extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;

  SliderItem({
    required this.imageUrl,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Image.asset(
          imageUrl,
          height: 250.0, // Adjust as needed
        ),
        SizedBox(height: 30.0),
        Text(
          title,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10.0),
        Text(
          description,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ],
    );
  }
}
