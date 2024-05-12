import express from "express";
import { getUserById } from "../controllers/userController";
import { getNomeProjeto } from "../controllers/projetoController";

const router = express.Router();

router.get("/", getNomeProjeto);
export default router;