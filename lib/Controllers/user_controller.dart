import 'package:flutter/material.dart';
import '../models/user.dart';

class UserController extends ChangeNotifier {
  final List<User> _users = [];

  List<User> get users => _users;

  void addUser(String userName, String password, int roleId) {
    final user = User(userName: userName, password: password, roleId: roleId);
    _users.add(user);
    notifyListeners(); // Notifica os ouvintes para atualizar a UI
  }

  void removeUser(int index) {
    _users.removeAt(index);
    notifyListeners(); // Notifica os ouvintes para atualizar a UI
  }
}

