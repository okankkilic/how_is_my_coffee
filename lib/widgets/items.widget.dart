import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/favorite_provider.dart';
import '../screens/single_item_screen.dart';

//ignore: must_be_immutable
class ItemsWidget extends StatefulWidget {
  const ItemsWidget({
    super.key,
  });

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  List<Item> coffee = [
    Item(
      id: 0,
      name: 'Latte',
      desc:
          'Step 1: Brew two shots of espresso (about 2 ounces) using an espresso machine. Pour into a cup or mug.\n'
          'Step 2: Steam 1/2 cup milk to 150 F.  Transfer the milk to a glass measuring cup and tap it on the counter a few times to break up any large bubbles.\n'
          'Step 3: Pour the steamed milk over the espresso, using a spoon to hold back the foam.\n'
          'Step 4: Top off the drink with the reserved foam. If you’re feeling fancy, you can use the foam to create latte art.\n',
    ),
    Item(id: 1, name: 'Espresso', desc: '25555espresso'),
    Item(id: 2, name: 'Americano', desc: '3'),
    Item(id: 3, name: 'Ice Latte', desc: '4'),
    Item(id: 4, name: 'Cappuiccino', desc: '5'),
  ];

  @override
  Widget build(BuildContext context) {
    final favouriteProvider = Provider.of<FavouriteProvider>(context);
    return GridView.builder(
        key: UniqueKey(),
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // İki sütunlu bir grid oluşturur
          childAspectRatio: (150 / 195),
        ),
        itemCount: coffee.length,
        itemBuilder: (context, index) {
          //final item = coffee[i];
          return Container(
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
                                  id: index,
                                  item: coffee[index],
                                )));
                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Image.asset(
                      "images/${coffee[index].name}.png",
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
                          coffee[index].name,
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
                                    builder: (context) => SingleItemScreen(
                                        id: index, item: coffee[index])));
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
              ]));
        });
  }
}
