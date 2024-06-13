import { Request,Response } from "express";
import query from "./db";

export async function list(req: Request, res: Response) {
    const { tablename } = req.body;
    try {
        const response = await query(`
        SELECT id, COALESCE(atribuicao, 'Não atríbuido') as atribuicao, COALESCE(status,'Não iniciado') as status, validacao, status_val, obs, area_km2 
        FROM ${tablename}
        UNION ALL
        SELECT id, atribuicao, status, validacao, status_val, obs, area_km2 
        FROM ${tablename}
    `);
        res.json(response.rows);
    } catch (error) {
        console.error("Erro ao executar a consulta:", error);
        res.status(500).json({ error: "Erro interno do servidor" });
    }
}