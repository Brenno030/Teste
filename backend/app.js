import express from "express";
import cors from "cors";
import mongoose from "mongoose";
import dotenv from "dotenv";
import authRoutes from './routes/authRoutes.js'; // ← ajuste o caminho

dotenv.config();
const app = express();
app.use(cors());
app.use(express.json());

// conexão com banco
mongoose.connect(process.env.MONGO_URI)
  .then(() => console.log("MongoDB conectado 🚀"))
  .catch(err => console.log(err));

// rotas
// ✅ REGISTRE AS ROTAS - Esta linha está faltando!
app.use('/auth', authRoutes); // ou app.use('/auth', authRoutes);

// Rota de saúde para teste
app.get('/api/health', (req, res) => {
  res.json({ status: 'OK', message: 'API funcionando' });
});

app.listen(3000, () => console.log("API rodando na porta 3000 💪"));
