import { Request,Response } from "express";
import query from "./db";

export async function list(req:Request, res:Response){
    const {tablename} = req.body;
    const response = await query(`select id,area_km2,municipio, cod_estado, cod_class, class, obs from ${tablename}`);
    res.json(response.rows);
}