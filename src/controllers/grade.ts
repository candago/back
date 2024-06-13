import { Request,Response } from "express";
import query from "./db";

export async function list(req: Request, res: Response) {
    const { city } = req.body;
    try {
        const response = await query(`select * from tabelaGeral where cidade = '${city}'`);
        res.json(response);
    } catch (error) {
        console.error("Erro ao executar a consulta:", error);
        res.status(500).json({ error: "Erro interno do servidor" });
    }
}