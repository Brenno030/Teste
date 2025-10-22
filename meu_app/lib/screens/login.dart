import 'package:flutter/material.dart';
import 'package:meu_app/screens/Cadastro.dart';
import 'login.form.dart';
import 'loginTreinador.dart'; // ← Import com o nome correto do arquivo

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEEF7FF),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 88,
                height: 77,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage("https://placehold.co/88x77"),
                    fit: BoxFit.cover,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
              ),
              Text(
                'TechBala',
                style: TextStyle(
                  color: const Color(0xFF3A3A3A),
                  fontSize: 40,
                  fontFamily: 'Rubik Glitch',
                  fontWeight: FontWeight.w400,
                  height: 0.50,
                  letterSpacing: 0.40,
                ),
              ),
              SizedBox(height: 60),

              // Botão Treinador
              Container(
                width: 290,
                height: 53,
                decoration: BoxDecoration(
                  // ← CORREÇÃO: BoxDecoration em vez de ShapeDecoration
                  color: Color(0xFFA0DAFF),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    // ← CORREÇÃO: boxShadow em vez de shadows
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginTreinador(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .transparent, // ← Fundo transparente para mostrar o Container
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.zero, // ← Remove padding padrão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation:
                        0, // ← Remove sombra do botão (já tem no Container)
                  ),
                  child: Text(
                    'Treinador',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              SizedBox(height: 20), // ← ESPAÇAMENTO ENTRE BOTÕES
              // Botão Atleta - CORRIGIDO
              Container(
                width: 290,
                height: 53,
                decoration: BoxDecoration(
                  // ← CORREÇÃO: BoxDecoration em vez de ShapeDecoration
                  color: Color(0xFFA0DAFF),
                  borderRadius: BorderRadius.circular(30),
                  boxShadow: [
                    // ← CORREÇÃO: boxShadow em vez de shadows
                    BoxShadow(
                      color: Color(0x3F000000),
                      blurRadius: 4,
                      offset: Offset(0, 4),
                      spreadRadius: 0,
                    ),
                  ],
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginFormScreen(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors
                        .transparent, // ← Fundo transparente para mostrar o Container
                    foregroundColor: Colors.black,
                    padding: EdgeInsets.zero, // ← Remove padding padrão
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation:
                        0, // ← Remove sombra do botão (já tem no Container)
                  ),
                  child: Text(
                    'Atleta',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              SizedBox(height: 190), // ← ESPAÇAMENTO ENTRE BOTÕES

              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Cadastro()),
                  );
                },
                child: Text(
                  'Começar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: const Color(0xFF2441FF),
                    fontSize: 20,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    height: 1,
                    letterSpacing: 0.20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
