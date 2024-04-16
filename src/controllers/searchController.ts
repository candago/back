import { Request, Response } from "express";
import pool from "./db";
import { Search } from "../model/search"; // Importando a classe Search

const search = new Search(); // Criando uma instância da classe Search

export async function searchController(req: Request, res: Response) {
    const { tablename, filterBy, filterValue } = req.body;

    if (!tablename || !filterBy || !filterValue) {
        return res.status(400).json({ message: "Os parâmetros 'tablename', 'filterBy' e 'filterValue' são obrigatórios." });
    }

    try {
        // Verifica se a coluna especificada é válida
        const validColumns = ['id', 'atribuicao', 'status', 'validacao', 'status_val', 'obs', 'area_km2'];
        if (!validColumns.includes(filterBy)) {
            return res.status(400).json({ message: "Nome de coluna inválido" });
        }

        // Executa uma consulta SQL para obter os dados da coluna especificada
        const query = `SELECT * FROM ${tablename}`;
        const result = await pool.query(query);
        const data = result.rows.map(row => row[filterBy]);

        // Busca a linha onde o valor foi encontrado
        const position = search.sequential(filterValue, data);

        if (position !== -1) {
            const queryAll = `SELECT * FROM ${tablename}`;
            const resultAll = await pool.query(queryAll);
            const rowData = resultAll.rows[position];
            return res.json({ message: `Valor '${filterValue}' encontrado na linha`, data: rowData });
        } else {
            return res.json({ message: `Valor '${filterValue}' não encontrado na coluna '${filterBy}' da tabela '${tablename}'` });
        }
    } catch (error) {
        return res.status(500).json({ message: "Erro ao buscar dados do banco de dados", error });
    }
}
