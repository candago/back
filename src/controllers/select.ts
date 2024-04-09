import { Request, Response } from "express";
import pool from "./db";

async function list(req: Request, res: Response) {
  const { tablename } = req.body;
  const response = await pool.query(`select * from ${tablename}`);
  res.json(response.rows);
}

export { list };
