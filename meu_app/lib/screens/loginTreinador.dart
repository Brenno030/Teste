import 'package:flutter/material.dart';

class LoginTreinador extends StatelessWidget { // ← NOME DA CLASSE
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login do treinador'),
      ),
      body: Center(
        child: Text('Tela de Login do treinador'),
      ),
    );
  }
}