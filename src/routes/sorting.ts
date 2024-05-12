import express from "express";
import { sortingController } from "../controllers/sortingController";

const router = express.Router();

router.post("/sort", sortingController);

export default router;
