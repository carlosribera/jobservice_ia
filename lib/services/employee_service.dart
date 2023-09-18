import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/employee.dart';

class EmployeeService {
  CollectionReference employeeRef =
      FirebaseFirestore.instance.collection(Employee.collectionId);

// Crear empleado
  Future<void> create(Employee employee) async {
    await employeeRef.add(employee.toMap());
  }

// Obtener un empleado por ID
  Future<Employee> getById(String uid) async {
    Employee employee;
    DocumentSnapshot documentSnapshot = await employeeRef.doc(uid).get();
    if (documentSnapshot.exists) {
      employee =
          Employee.fromSnapshot(documentSnapshot.id, documentSnapshot.data());
    }
    return employee;
  }

// obtener un Empleado
  Future<List<Employee>> get() async {
    QuerySnapshot querySnapshot = await employeeRef.get();
    return querySnapshot.docs
        .map((ds) => Employee.fromSnapshot(ds.id, ds.data()))
        .toList();
  }

  Stream<List<Employee>> getByNombres(String nombres) {
    return employeeRef.where('nombres', isEqualTo: nombres).snapshots().map(
        (e) => e.docs
            .map((ds) => Employee.fromSnapshot(ds.id, ds.data()))
            .toList());
  }
  
  Future<List<Employee>> getByCategoria(String categoria) async {
    QuerySnapshot querySnapshot = await employeeRef.where('categoria', isEqualTo: categoria).get();
    return querySnapshot.docs
        .map((ds) => Employee.fromSnapshot(ds.id, ds.data()))
        .toList();
  }

}
