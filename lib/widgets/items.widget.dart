import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../provider/favorite_provider.dart';
import '../screens/single_item_screen.dart';

//ignore: must_be_immutable
class ItemsWidget extends StatelessWidget {
  ItemsWidget({
    super.key,
  });

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
    return GridView.count(
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      shrinkWrap: true,
      childAspectRatio: (150 / 195),
      children: [
        for (int i = 0; i < coffee.length; i++)
          Container(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 13),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF212325),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.4),
                    spreadRadius: 1,
                    blurRadius: 8,
                  ),
                ],
              ),
              child: Column(children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SingleItemScreen(
                                  coffee[i],
                                )));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      "images/${coffee[i].name}.png",
                      width: 120,
                      height: 120,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          coffee[i].name,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        const Text(
                          "Best Coffee",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          " ",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SingleItemScreen(coffee[i])));
                          },
                          child: Container(
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color(0xFFE57734),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(
                              CupertinoIcons.add,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ))
              ]))
      ],
    );
  }
}
