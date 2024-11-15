import 'package:ecommerce/models/role.dart';
import 'package:flutter/material.dart';

class RoleController extends ChangeNotifier {
  List<Role> _roles = [
    Role(id: 1, name: 'Admin'),
    Role(id: 2, name: 'User'),
  ];

  // Função para adicionar um novo role
  void addRole(String name) {
    final newRole = Role(id: _roles.length + 1, name: name);
    _roles.add(newRole);
    notifyListeners();
  }

  // Função para remover um role
  void removeRole(int index) {
    _roles.removeAt(index);
    notifyListeners();
  }

  // Função para listar os papéis
  List<Role> get roles => _roles;

  getRoleById(int roleId) {}
}
