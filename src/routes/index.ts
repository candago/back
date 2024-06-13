import { Router } from "express";
import aoi from "./aoi";
import alteracao from "./alteracao";
import apontamento from "./apontamento";
import grade from "./grade";
import userController from "../controllers/UserController"
import dashboard  from "./dashboard";
import projetos from "./projetos";
import { searchController } from "../controllers/searchController";
import { sortingController } from "../controllers/sortingController";
import grafico from "./grafico";
import { validadeAcess } from "../middlewares";

const router = Router();

router.use("/aoi", aoi);
router.use("/alteracao", alteracao);
router.use("/apontamento", apontamento);
router.use("/grade", grade);
router.use("/search", searchController);
router.use("/sort", sortingController);
router.post("/login", userController.login);
router.use("/projeto", projetos);
router.use("/dashboard", dashboard);
router.use("/grafico",validadeAcess, grafico)

export default router;
