import 'package:flutter/material.dart';

class LoginFormScreen extends StatelessWidget { // ← NOME DA CLASSE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login do Atleta'),
      ),
      body: Center(
        child: Text('Tela de Login do Atleta'),
      ),
    );
  }
}