import express from "express";
import bcrypt from "bcryptjs"; // Para criptografar senha
import User from "../models/userModel.js";

const router = express.Router();

router.get("/", async (req, res) => {
  res.send("bem vindo");
});

// 🧾 Rota de cadastro
router.post("/cadastrar", async (req, res) => {
  try {
    // 👇 ADICIONE ESTES LOGS:
    console.log('🎯 ROTA /auth/cadastrar FOI CHAMADA!');
    console.log('📦 Body recebido:', req.body);
    console.log('📋 Headers:', req.headers);

    const { nome, email, senha } = req.body;

    // 👇 LOG para verificar se os campos chegaram
    console.log('🔍 Campos recebidos - Nome:', nome, 'Email:', email, 'Senha:', senha);

    // Verifica se já existe o e-mail no banco
    const usuarioExistente = await User.findOne({ email });
    if (usuarioExistente) {
      console.log('❌ Email já cadastrado:', email);
      return res.status(400).json({ erro: "Email já cadastrado" });
    }

    // Criptografa a senha antes de salvar
    const senhaHash = await bcrypt.hash(senha, 10);

    const novoUsuario = new User({ nome, email, senha: senhaHash });
    await novoUsuario.save();

    console.log('✅ USUÁRIO CRIADO COM SUCESSO:', email);
    res.status(201).json({ mensagem: "Usuário criado com sucesso!" });

  } catch (err) {
    console.log('💥 ERRO NO CADASTRO:', err.message);
    res.status(500).json({ erro: err.message });
  }
});

// 🔑 Rota de login
router.post("/login", async (req, res) => {
  try {
    const { email, senha } = req.body;

    const usuario = await User.findOne({ email });
    if (!usuario) {
      return res.status(400).json({ erro: "Usuário não encontrado" });
    }

    const senhaCorreta = await bcrypt.compare(senha, usuario.senha);
    if (!senhaCorreta) {
      return res.status(401).json({ erro: "Senha incorreta" });
    }

    res.json({ mensagem: "Login realizado com sucesso!", usuario });
  } catch (err) {
    res.status(500).json({ erro: err.message });
  }
});

export default router;
