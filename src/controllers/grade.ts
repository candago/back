import { Request,Response } from "express";
import pool from "./db";

export async function list(req: Request, res: Response) {
    const { tablename } = req.body;
    const query = `
        SELECT id, COALESCE(atribuicao, 'Não atríbuido') as atribuicao, COALESCE(status,'Não iniciado') as status, validacao, status_val, obs, area_km2 
        FROM ${tablename}
        UNION ALL
        SELECT id, atribuicao, status, validacao, status_val, obs, area_km2 
        FROM ${tablename}
    `;
    try {
        const response = await pool.query(query);
        res.json(response.rows);
    } catch (error) {
        console.error("Erro ao executar a consulta:", error);
        res.status(500).json({ error: "Erro interno do servidor" });
    }
}
