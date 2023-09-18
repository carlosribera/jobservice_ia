import 'package:flutter/material.dart';

import '../../../models/employee.dart';
import '../utils/data2.dart';
import '../widgets/product_item.dart';

class ViewEmployeeScreen extends StatelessWidget {
  final Employee employee;
  const ViewEmployeeScreen({Key key, this.employee}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          Center(child: Text(employee.nombres,style: const TextStyle(fontWeight: FontWeight.bold),)),
          const SizedBox(width: 20.0),
        ],
      ),
      body: Stack(
        children: [
          ListView(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            children: [
              const SizedBox(
                height: 25,
              ),
              CircleAvatar(
                radius: 70,
                backgroundImage: NetworkImage(employee.avatarUrl ??
                    'https://www.vhv.rs/dpng/d/138-1383989_default-svg-icon-free-avatar-png-transparent-png.png'),
              ),
              const SizedBox(
                height: 25,
              ),
              Text(
                '${employee.nombres} ${employee.apellidos}',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(employee.email,
                textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 18, color: Colors.black54)),
              const SizedBox(height: 10.0),
              const Text(
                "Teléfono",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                employee.telefono,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Categoria",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                employee.categoria,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 10.0),
              const Text(
                "Description",
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Text(
                  employee.descripcion,
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Text(
                "Photos",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10.0),
              buildProductList(),
            ],
          ),
        ],
      ),
    );
  }

  buildProductList() {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SizedBox(
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
      ),
    );
  }
}
