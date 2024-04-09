import { Router } from "express";
import aoi from "./aoi";

const router = Router();

router.use("/usuario", aoi);

export default router;