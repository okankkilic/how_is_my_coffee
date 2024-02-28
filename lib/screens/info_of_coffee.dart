import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class InfoOfCoffee extends StatelessWidget {
  InfoOfCoffee({super.key});

  List que = [
    'WHAT IS COFFEE?',
    'Where is coffee grown?',
    'Where did coffee originate?',
    'How is coffee decaffeinated?'
  ];
  List ans = [
    'Coffee is a beverage brewed from the roasted and ground seeds of the tropical evergreen coffee plant. Coffee is one of the three most popular beverages in the world (alongside water and tea), and it is one of the most profitable international commodities.',
    'Latin America, eastern Africa, Asia, and Arabia are leading producers of Arabica coffee. The Arabica bean requires a cool subtropical climate. It grows at higher elevations and requires a lot of moisture, sun, and shade. Western and Central Africa, Southeast Asia, and Brazil are major producers of Robusta coffee. The Robusta bean can grow at lower elevations.',
    'Wild coffee plants, probably from Kefa (Kaffa), Ethiopia, were taken to southern Arabia and placed under cultivation in the 15th century. The popularity of coffee in the Arab world led to the creation of the coffeehouse, first in Mecca and then in Constantinople in the 15th and 16th centuries, respectively. Coffee was introduced into one European country after another throughout the 16th and 17th centuries.',
    'The main methods of decaffeination are based on chemical solvents, carbon filtering, carbon dioxide extraction, or triglycerides. In all cases, to make “decaf,” the caffeine is removed in the green bean stage, before the coffee is roasted. Regardless of the method, coffee is never 100% caffeine-free.'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white.withOpacity(0.5),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedTextKit(
                        animatedTexts: [
                          TypewriterAnimatedText(
                            que[0],
                            textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w500,
                            ),
                            speed: const Duration(milliseconds: 100),
                          ),
                        ],
                        totalRepeatCount: 3,
                        pause: const Duration(milliseconds: 2000),
                        displayFullTextOnTap: true,
                        stopPauseOnTap: true,
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        ans[0],
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 20,
                          //fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        que[1],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        ans[1],
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 20,
                          //fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        que[2],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        ans[2],
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 20,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        que[3],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        ans[3],
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.7),
                          fontSize: 20,
                          //fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
