import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  // Endereço base do seu backend Node.js
  // No emulador Android, use "10.0.2.2"
  final String baseUrl = 'http://localhost:3000/auth';

  // Função de login que envia o email e senha para o backend
  Future<bool> login(String email, String senha) async {
    try {
      // Faz uma requisição POST para a rota /login
      final response = await http.post(
        Uri.parse("$baseUrl/login"),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({"email": email, "senha": senha}),
      );

      // Se o backend responder com sucesso (status 200)
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        print("✅ Login bem-sucedido!");
        print("Token recebido: ${data['token']}"); // mostra o token JWT
        return true;
      } else {
        print("❌ Erro no login: ${response.body}");
        return false;
      }
    } catch (e) {
      print("⚠️ Erro de conexão: $e");
      return false;
    }
  }
}
