import express from "express";
const router = express.Router();
import { criarGrafico, progressAreaPerUser } from "../controllers/grafico";

router.get("/", criarGrafico);
router.get("/areaPerUser", progressAreaPerUser);
export default router;