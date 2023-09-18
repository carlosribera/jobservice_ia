import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../models/employee.dart';
import '../../../services/employee_service.dart';
import 'search_employee_screen.dart';
import 'view_employee_screen.dart';

class CategoryItem extends StatefulWidget {
  final String categoria;

  const CategoryItem({Key key, this.categoria}) : super(key: key);
  @override
  // ignore: library_private_types_in_public_api
  _CategoryItemState createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  CollectionReference coleccion =
      FirebaseFirestore.instance.collection('employee');

  EmployeeService employeeService = EmployeeService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return const SearchEmployeeScreen();
              },
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.search, color: Colors.white),
      ),
      body: Center(
        child: FutureBuilder<List<Employee>>(
          future: employeeService.getByCategoria(widget.categoria),
          builder:
              (BuildContext context, AsyncSnapshot<List<Employee>> snapshot) {
            if (snapshot.hasError) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Icon(
                    Icons.error_outline,
                    color: Colors.red,
                    size: 60,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text('Error: ${snapshot.error}'),
                  ),
                ],
              );
            }
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: CircularProgressIndicator(),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 16),
                      child: Text('Awaiting result...'),
                    ),
                  ],
                );
              default:
                final employee = snapshot.data;
                return ListView.builder(
                  itemCount: employee.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(employee[index]
                                .avatarUrl ??
                            'https://www.vhv.rs/dpng/d/138-1383989_default-svg-icon-free-avatar-png-transparent-png.png'),
                      ),
                      title: Text(
                          '${employee[index].nombres} ${employee[index].apellidos}'),
                      subtitle: Text(employee[index].email),
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ViewEmployeeScreen(
                              employee: employee[index],
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
            }
          },
        ),
      ),
    );
  }
}
