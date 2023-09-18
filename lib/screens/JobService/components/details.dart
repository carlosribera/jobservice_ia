import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

import '../utils/data.dart';
import '../utils/data2.dart';
import '../widgets/badge.dart';
import '../widgets/product_item.dart';

class Details extends StatefulWidget {
  const Details({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const <Widget>[
          Center(
            child: IconBadge(
              icon: Feather.shopping_cart,
            ),
          ),
          SizedBox(width: 20.0),
        ],
      ),
      body: Stack(
        children: <Widget>[
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            children: <Widget>[
              const SizedBox(height: 10.0),
              buildImage(),
              const SizedBox(height: 20.0),
              Text(
                "${furnitures[0]["name"]}",
                style: const TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "\$550.00",
                style: TextStyle(
                  fontSize: 27.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 30.0),
              const Text(
                "Description",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Sed porttitor lectus nibh. Cras ultricies ligula "
                "sed magna dictum porta. Praesent sapien massa, "
                "convallis a pellentesque nec, egestas non nisi. "
                "Lorem ipsum dolor sit amet, consectetur adipiscing "
                "elit. Nulla porttitor accumsan tincidunt. "
                "Curabitur arcu erat, accumsan id imperdiet et, "
                "porttitor at sem.",
                style: TextStyle(
                  fontSize: 15.0,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Photos",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              buildProductList(),
              const SizedBox(height: 10.0),
            ],
          ),
          buildFloatingButton(),
        ],
      ),
    );
  }

  buildProductList() {
    return SizedBox(
      height: 100.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: works.length,
        itemBuilder: (BuildContext context, int index) {
          Map work = works.reversed.toList()[index];

          return ProductItem(
            furniture: work,
          );
        },
      ),
    );
  }

  buildFloatingButton() {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Container(
          height: 60.0,
          width: 60.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.secondary,
            boxShadow: [
              BoxShadow(
                color: Colors.orange[200],
                offset: const Offset(0.0, 10.0),
                blurRadius: 10,
              ),
            ],
          ),
          child: const Center(
            child: Icon(
              Feather.plus,
              color: Colors.white,
              size: 25.0,
            ),
          ),
        ),
      ),
    );
  }

  buildImage() {
    return SizedBox(
      height: 240.0,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "${furnitures[0]["img"]}",
              height: 240.0,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            right: -10.0,
            bottom: 3.0,
            child: RawMaterialButton(
              onPressed: () {},
              fillColor: Colors.white,
              shape: const CircleBorder(),
              elevation: 4.0,
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Icon(
                  Feather.heart,
                  color: Theme.of(context).colorScheme.secondary,
                  size: 17.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
