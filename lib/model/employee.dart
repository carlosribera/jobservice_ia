class Employee {
  String idEmployee;
  String nombres;
  String apellidos;
  String edad;
  String categoria;
  String descripcion;
  String email;
  String telefono;
  String avatarUrl;

  static const String collectionId = 'employee';
  Employee(
      {this.idEmployee,
      this.nombres,
      this.apellidos,
      this.edad,
      this.categoria,
      this.descripcion,
      this.email,
      this.telefono,
      this.avatarUrl});

  Employee.fromSnapshot(this.idEmployee, Map<String, dynamic> employee)
      : nombres = employee['nombres'],
        apellidos = employee['apellidos'],
        edad = employee['edad'],
        categoria = employee['categoria'],
        descripcion = employee['descripcion'],
        email = employee['email'],
        telefono = employee['telefono'],
        avatarUrl = employee['avatarUrl'];

  Map<String, dynamic> toMap() => {
        'nombres': nombres,
        'apellidos': apellidos,
        'edad': edad,
        'categoria': categoria,
        'descripcion': descripcion,
        'email': email,
        'telefono': telefono,
        'avatarUrl': avatarUrl,
      };

  @override
  String toString() {
    return 'Employee{idEmployee: $idEmployee, nombres: $nombres, apellidos: $apellidos, edad: $edad, categoria: $categoria, descripcion: $descripcion, email: $email, telefono: $telefono, avatarUrl:$avatarUrl}';
  }
}