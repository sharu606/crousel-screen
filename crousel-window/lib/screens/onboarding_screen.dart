import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:crousel_screen/utilities/styles.dart';
import 'package:crousel_screen/background.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreen createState() => _OnboardingScreen();
}

class _OnboardingScreen extends State<OnboardingScreen> {
  final int _numPages = 3;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Color(0xFF0047B3) : Color(0xFFCCE0FF),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build (BuildContext context) {
    return Scaffold (
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 40.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget> [
                Container (
                  alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () => print('Skip'),
                      child: Text(
                        'Skip',
                        style: TextStyle (
                          color: Color(0xFF0047B3),
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                ),
                Container(
                  height: 600.0,
                  child: PageView(
                    physics: ClampingScrollPhysics(),
                    controller: _pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/onboarding0.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Text(
                                'When you breath,\nnobody steal peace. ',
                                style: kTitleStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Center(
                              child: Text(
                                  'Meditation and yoga are the best tools to get the control and peace back in life.',
                              style: kSubtitleStyle,
                                textAlign: TextAlign.center,
                                ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/onboarding3.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Text(
                                'Stress doesn\'t kill\nreactions do',
                                style: kTitleStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Center(
                              child: Text(
                                'Get peace by listening to soothing music and change your reaction',
                                style: kSubtitleStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/images/onboarding2.png',
                                ),
                                height: 300.0,
                                width: 300.0,
                              ),
                            ),
                            SizedBox(height: 30.0),
                            Center(
                              child: Text(
                                'Worried about calories \nwhile sitting at home?',
                                style: kTitleStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 15.0),
                            Center(
                              child: Text(
                                'Use our calory counter to measure the diet effectively.',
                                style: kSubtitleStyle,
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: _buildPageIndicator(),
                ),
                _currentPage != _numPages - 1
                ? Expanded(
                  child: Align(
                    alignment: FractionalOffset.bottomRight,
                    child: FlatButton(
                      onPressed: () {
                        _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                        );
                      },
                    ),
                  ),
                )
                : Text(''),
              ],
            ),
        ),
      ),
      bottomSheet: _currentPage == _numPages - 1
      ? Container (
        height: 60.0,
        width: double.infinity,
        color: Color(0xFF0047B3),
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(bottom: 10.0, top: 10.0),
            child: Text(
              'Get started',
              style: TextStyle(
                color: Color(0xFFCCE0FF),
                fontSize: 20.0,
              ),
            ),
          ),
        ),
      )
          : Text (''),
    );
  }
}