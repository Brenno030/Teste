// define o formato do usuário no banco de dados
import mongoose from "mongoose";

const userSchema = new mongoose.Schema({
  nome: String,
  email: { type: String, unique: true },
  senha: String,
});

export default mongoose.model("User", userSchema);
