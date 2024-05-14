import express from "express";
import { getUserById } from "../controllers/userController";
import { getNomeProjeto, listarProjetos } from "../controllers/projetoController";

const router = express.Router();

router.post("/analista", listarProjetos);
router.get("/", getNomeProjeto);

export default router;