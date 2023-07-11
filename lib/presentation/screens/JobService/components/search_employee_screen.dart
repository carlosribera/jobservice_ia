import 'package:flutter/material.dart';

import '../../../../model/employee.dart';
import '../../../../services/employee_service.dart';
import '../utils/utils.dart';

class SearchEmployeeScreen extends StatefulWidget {
  const SearchEmployeeScreen({Key key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchEmployeeScreenState createState() => _SearchEmployeeScreenState();
}

class _SearchEmployeeScreenState extends State<SearchEmployeeScreen> {
  EmployeeService employeeService = EmployeeService();
  String nombres = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buscar Trabajador'),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: kTextFieldDecoration.copyWith(labelText: 'Nombre'),
                onChanged: (value) {
                  setState(() => nombres = value);
                },
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            nombres.isNotEmpty
                ? Expanded(
                    child: StreamBuilder<List<Employee>>(
                      stream: employeeService.getByNombres(nombres),
                      builder: (BuildContext context,
                          AsyncSnapshot<List<Employee>> snapshot) {
                        if (snapshot.hasError) {
                          return Text('Error: ${snapshot.error}');
                        }
                        switch (snapshot.connectionState) {
                          case ConnectionState.waiting:
                            return const Text('Cargando...');
                          default:
                            final employee = snapshot.data;
                            return ListView.builder(
                              itemCount: employee.length,
                              itemBuilder: (BuildContext context, int index) {
                                return ListTile(
                                  leading: CircleAvatar(
                                    radius: 25,
                                    backgroundImage: NetworkImage(employee[
                                                index]
                                            .avatarUrl ??
                                        'https://www.vhv.rs/dpng/d/138-1383989_default-svg-icon-free-avatar-png-transparent-png.png'),
                                  ),
                                  title: Text('${employee[index].nombres} ${employee[index].apellidos}'),
                                  subtitle: Text(employee[index].email ?? ""),
                                );
                              },
                            );
                        }
                      },
                    ),
                  )
                : const Text('Campo Vacio'),
          ],
        ),
      ),
    );
  }
}
