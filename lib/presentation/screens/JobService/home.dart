import 'package:flutter/material.dart';


import 'package:jobservice_ia/presentation/screens/JobService/widgets/product_item.dart';

import 'utils/data.dart';
import 'utils/data2.dart';
import 'widgets/room_item.dart';

class Home extends StatefulWidget {
  const Home({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.list),
        onPressed: () {},
      ),
      body: ListView(
        padding: const EdgeInsets.all(10.0),
        children: <Widget>[
          // Wrap(
          //   children: [
          //     Container(
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         boxShadow: [
          //           BoxShadow(
          //             blurRadius: 4,
          //             color: Color(0x3600000F),
          //             offset: Offset(0, 2),
          //           )
          //         ],
          //         borderRadius: BorderRadius.circular(8),
          //       ),
          //       child: Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Column(children: [
          //           Text(
          //             "Plomero",
          //             style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          //           ),
          //           Text("10 disponibles"),
          //         ]),
          //       ),
          //     ),
          //   ],
          // ),
          // SizedBox(height: 30.0),
          buildRoomList(),
          const SizedBox(height: 20.0),
          // buildTitleRow(),
          // buildProductList(),
          // SizedBox(height: 10.0),
        ],
      ),
    );
  }

// Lista de las categorias
  buildRoomList() {
    return SizedBox(
      height: 800,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: furnitures.length,
        itemBuilder: (BuildContext context, int index) {
          Map furniture = furnitures[index];

          return RoomItem(
            furniture: furniture,
          );
        },
      ),
    );
  }

// Titulo fijo
  buildTitleRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        const Text(
          "Popular Products",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
        TextButton(
          child: const Text(
            "View More",
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
          onPressed: () {},
        ),
      ],
    );
  }

// Lista de Productos
  buildProductList() {
    return SizedBox(
      height: 140.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: works.length,
        itemBuilder: (BuildContext context, int index) {
          Map work = works[index];

          return ProductItem(
            furniture: work,
          );
        },
      ),
    );
  }
}
