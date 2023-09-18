import 'package:flutter/material.dart';

import '../components/details.dart';

class ProductItem extends StatelessWidget {
  final Map furniture;

  const ProductItem({Key key, this.furniture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const Details();
              },
            ),
          );
        },
        child: SizedBox(
          height: 140,
          width: 140,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              "${furniture["img"]}",
              height: 140,
              width: 140,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}
