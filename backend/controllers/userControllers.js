// controla o que acontece nas rotas (ex: login, registro)
import User from "../models/userModel.js";
import bcrypt from "bcryptjs";
import jwt from "jsonwebtoken";

// função para registrar um novo usuário
export const registrar = async (req, res) => {
  const { nome, email, senha } = req.body; // pega os dados enviados pelo app

  try {
    // criptografa a senha antes de salvar
    const senhaCriptografada = await bcrypt.hash(senha, 10);

    // cria o usuário no banco com a senha criptografada
    const novoUser = await User.create({ nome, email, senha: senhaCriptografada });

    // retorna o usuário criado
    res.status(201).json(novoUser);
  } catch (error) {
    res.status(400).json({ erro: "Erro ao registrar usuário" });
  }
};

// função de login
export const login = async (req, res) => {
  const { email, senha } = req.body; // pega os dados enviados pelo app

  try {
    // busca usuário com o email informado
    const user = await User.findOne({ email });
    if (!user) return res.status(404).json({ erro: "Usuário não encontrado" });

    // compara a senha digitada com a senha criptografada no banco
    const senhaValida = await bcrypt.compare(senha, user.senha);
    if (!senhaValida) return res.status(401).json({ erro: "Senha incorreta" });

    // gera um token JWT (para autenticação futura)
    const token = jwt.sign(
      { id: user._id },        // payload: id do usuário
      process.env.JWT_SECRET,  // chave secreta (fica no .env)
      { expiresIn: "1d" }      // tempo de expiração: 1 dia
    );

    // envia o token e dados do usuário para o app Flutter
    res.json({ token, user });
  } catch (error) {
    res.status(500).json({ erro: "Erro no login" });
  }
};
