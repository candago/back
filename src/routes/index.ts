import { Router } from "express";
import aoi from "./aoi";
import alteracao from "./alteracao";
import apontamento from "./apontamento";
import grade from "./grade";
import user from "./user"
import { searchController } from "../controllers/searchController";
import { sortingController } from "../controllers/sortingController";
import { getNomeProjeto } from "../controllers/projetoController";

const router = Router();

router.use("/aoi", aoi);
router.use("/alteracao", alteracao);
router.use("/apontamento", apontamento);
router.use("/grade", grade);
router.use("/search", searchController);
router.use("/sort", sortingController);
router.use("/user", user);
router.use("/projeto", getNomeProjeto);
export default router;