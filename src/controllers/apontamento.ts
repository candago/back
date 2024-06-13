import { Request,Response } from "express";
import query from "./db";

export async function list(req:Request, res:Response){
    const {tablename} = req.body;
    const response = await query(`select id,correcao,status,obs from ${tablename}`);
    res.json(response.rows);
}