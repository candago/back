import { Router } from "express";
import { dashboard } from "../controllers/carregarDashboard";

const router = Router();

router.post("/", dashboard);

export default router;