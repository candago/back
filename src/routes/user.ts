import { login, signup } from "../controllers/userController";
import express from "express";
import { getUserById } from "../controllers/userController";
const router = express.Router();

router.post("/", signup);
router.get("/", getUserById);
router.get("/login", login)
export default router;