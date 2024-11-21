import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/user_controller.dart';
import '../controllers/roler_controller.dart';

class UserListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);
    final roleController = Provider.of<RoleController>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Usuários'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Adicionar usuário
              showDialog(
                context: context,
                builder: (context) {
                  return AddUserDialog(roleController: roleController);
                },
              );
            },
          ),
        ],
      ),
      body: Consumer<UserController>(
        builder: (context, userController, child) {
          // Verifica se há usuários para exibir
          if (userController.users.isEmpty) {
            return const Center(child: Text("Nenhum usuário cadastrado"));
          }

          // Exibe a lista de usuários
          return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              final user = userController.users[index];
              final role = roleController.getRoleById(user.roleId);

              // Se o role for nulo, mostramos "Papel desconhecido", mas caso contrário, mostramos o nome do papel
              final roleName = role?.name ?? _getRoleNameFromId(user.roleId);

              return ListTile(
                title: Text(user.userName),
                subtitle: Text(roleName),
                trailing: IconButton(
                  icon: const Icon(Icons.delete),
                  onPressed: () {
                    userController.removeUser(index);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }

  // Método para retornar o tipo de papel caso role seja nulo
  String _getRoleNameFromId(int roleId) {
    // Retorna o nome do papel com base no ID
    switch (roleId) {
      case 1:
        return "ADMIN"; // Supondo que 1 seja o ID de ADMIN
      case 2:
        return "USER"; // Supondo que 2 seja o ID de USER
      default:
        return "Papel desconhecido"; // Caso não corresponda a nenhum papel
    }
  }
}

class AddUserDialog extends StatefulWidget {
  final RoleController roleController;

  const AddUserDialog({super.key, required this.roleController});

  @override
  _AddUserDialogState createState() => _AddUserDialogState();
}

class _AddUserDialogState extends State<AddUserDialog> {
  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();
  int? _selectedRole;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Adicionar Usuário'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _userNameController,
            decoration: const InputDecoration(labelText: 'Nome de Usuário'),
          ),
          TextField(
            controller: _passwordController,
            decoration: const InputDecoration(labelText: 'Senha'),
            obscureText: true,
          ),
          DropdownButton<int>(
            value: _selectedRole,
            hint: const Text('Selecione o Papel'),
            onChanged: (newRole) {
              setState(() {
                _selectedRole = newRole;
              });
            },
            items: widget.roleController.roles
                .map((role) => DropdownMenuItem<int>(
                      value: role.id,
                      child: Text(role.name),
                    ))
                .toList(),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Cancelar'),
        ),
        TextButton(
          onPressed: () {
            if (_selectedRole != null &&
                _userNameController.text.isNotEmpty &&
                _passwordController.text.isNotEmpty) {
              // Adiciona o usuário ao controller
              Provider.of<UserController>(context, listen: false).addUser(
                _userNameController.text,
                _passwordController.text,
                _selectedRole!,
              );
              Navigator.of(context).pop();
            }
          },
          child: const Text('Adicionar'),
        ),
      ],
    );
  }
}
