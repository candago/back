import { Router } from "express";
import { list } from "../controllers/carregarDashboard";

const router = Router();

router.post("/", list);

export default router;