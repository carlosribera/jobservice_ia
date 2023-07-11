import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../model/employee.dart';
import '../components/categoria_item.dart';

// ignore: must_be_immutable
class RoomItem extends StatelessWidget {
  final Map furniture;
  
  CollectionReference employeeRef =
      FirebaseFirestore.instance.collection(Employee.collectionId);
  
  RoomItem({Key key, this.furniture}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return CategoryItem(
                  categoria: furniture['name'],
                );
              },
            ),
          );
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x3600000F),
                offset: Offset(0, 2),
              )
            ],
            borderRadius: BorderRadius.circular(8),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  furniture['name'],
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                const Text("10 disponibles"),
                // SizedBox(height: 10),
                // ClipRRect(
                //   borderRadius: BorderRadius.circular(15),
                //   child: Image.asset(
                //     "${furniture["img"]}",
                //     height: 240,
                //     width: 280,
                //     fit: BoxFit.cover,
                //   ),
                // ),
              ],
            ),
            
          ),
        ),
      ),
    );
  }
}
