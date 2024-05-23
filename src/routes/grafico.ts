import express from "express";
const router = express.Router();
import { criarGrafico } from "../controllers/grafico";

router.get("/", criarGrafico);

export default router;