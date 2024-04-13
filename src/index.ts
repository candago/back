import express from "express";
import dotenv from "dotenv";
import routes from "./routes";
// import cors from "cors";
dotenv.config();

const PORT = process.env.PORT || 3001 ;
const app = express();
app.use(express.json());
// app.use(cors());

app.listen(PORT,() => console.log(`Rodando na porta ${PORT}...`))

app.use(routes);
