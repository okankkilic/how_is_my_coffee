import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorite_provider.dart';
//ignore: must_be_immutable

class SingleItemScreen extends StatefulWidget {
  int i;

  SingleItemScreen(
    this.i,
  );

  @override
  State<SingleItemScreen> createState() => _SingleItemScreenState();
}

class _SingleItemScreenState extends State<SingleItemScreen> {
  List<Item> coffee = [
    Item(
      'Latte',
      'Step 1: Brew two shots of espresso (about 2 ounces) using an espresso machine. Pour into a cup or mug.\n'
          'Step 2: Steam 1/2 cup milk to 150 F.  Transfer the milk to a glass measuring cup and tap it on the counter a few times to break up any large bubbles.\n'
          'Step 3: Pour the steamed milk over the espresso, using a spoon to hold back the foam.\n'
          'Step 4: Top off the drink with the reserved foam. If you’re feeling fancy, you can use the foam to create latte art.\n',
    ),
    Item('Espresso', '2espresso'),
    Item('Americano', '3'),
    Item('Ice Latte', '4'),
    Item('Cappuiccino', '5'),
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
                    "images/${coffee[widget.i].name}.png",
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
                        coffee[widget.i].name,
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
                        coffee[widget.i].desc,
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
                                image: AssetImage(
                                    "gif/${coffee[widget.i].name}.gif"),
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
                                Consumer<FavouriteProvider>(
                                  builder: (context, favouriteProvider, child) {
                                    return GestureDetector(
                                      onTap: () {
                                        if (favouriteProvider.items
                                            .contains(coffee[widget.i])) {
                                          favouriteProvider
                                              .removeItem(coffee[widget.i]);
                                        } else {
                                          favouriteProvider
                                              .addItem(coffee[widget.i]);
                                        }
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFE57734),
                                          borderRadius:
                                              BorderRadius.circular(5),
                                        ),
                                        child: Icon(
                                          favouriteProvider.items
                                                  .contains(coffee[widget.i])
                                              ? Icons.favorite_outlined
                                              : Icons.favorite_outline,
                                          color: Colors.white,
                                        ),
                                      ),
                                    );
                                  },
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
