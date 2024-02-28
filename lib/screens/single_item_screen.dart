import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
//ignore: must_be_immutable

class SingleItemScreen extends StatelessWidget {
  String img;
  String desc;
  SingleItemScreen(
    this.img,
    this.desc,
  );

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
                  padding: const EdgeInsets.only(left: 25),
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
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Image.asset(
                    "images/$img.png",
                    width: MediaQuery.of(context).size.width / 1.2,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 25, right: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "BEST COFFEE",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          letterSpacing: 3,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        img,
                        style: const TextStyle(
                          fontSize: 30,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(15),
                              width: 120,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color: Colors.white.withOpacity(0.2)),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons.minus,
                                    size: 18,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        desc,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Volume : 60 ml",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 200,
                              width: 200,
                              child: Image(
                                image: AssetImage("gif/$img.gif"),
                              ),
                            ),

                            //AnimatedWidgetIcon(),

                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(bottom: 8),
                                  child: Text("Add your favorite!",
                                      style: TextStyle(
                                        color: Colors.white,
                                      )),
                                ),
                                Container(
                                  // padding: EdgeInsets.all(1),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFE57734),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: LikeButton(
                                    size: 70,
                                    animationDuration:
                                        const Duration(milliseconds: 1000),
                                    likeBuilder: (isTapped) {
                                      return Icon(
                                        Icons.bookmark,
                                        color: isTapped
                                            ? Colors.yellow.shade500
                                            : Colors.white,
                                        size: 50,
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            /*
                            Container(
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Color(0xFFE57734),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: const Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                              ),
                            ),

                             */
                          ],
                        ),
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
