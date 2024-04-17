import { Request, Response } from "express";
import pool from "./db";
import { Sort } from "../model/bubble_sort";

const sort = new Sort<number>(); 

export async function sortingController(req: Request, res: Response) {
    const { tablename } = req.body;

    if (!tablename) {
        return res.status(400).json({ message: "O parâmetro 'tablename' é obrigatório." });
    }

    try {
        //SQL
        const query = `SELECT id, atribuicao, status, validacao, status_val, obs, area_km2 FROM ${tablename}`;
        const result = await pool.query(query);
        let data = result.rows;

        // Extração apenas dos valores de area_km2
        let areas: number[] = data.map(row => row.area_km2);

    
        sort.bubble_naive(areas);

        // Criando um novo array ordenado com base nos valores de area_km2
        let sortedData = areas.map(area => data.find(row => row.area_km2 === area));

        return res.json({ message: `Dados da tabela '${tablename}' ordenados pela coluna 'area_km2'`, data: sortedData });
    } catch (error) {
        return res.status(500).json({ message: "Erro ao buscar dados do banco de dados", error });
    }
}
