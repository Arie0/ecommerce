class Role {
  final int id;
  final String name;

  Role({
    required this.id,
    required this.name,
  });

  // Método para converter de um Map para um objeto Role
  factory Role.fromMap(Map<String, dynamic> map) {
    return Role(
      id: map['id'],
      name: map['name'],
    );
  }

  // Método para converter um objeto Role para um Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
    };
  }
}
