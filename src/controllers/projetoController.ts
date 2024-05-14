import { Request, Response } from 'express';
import projeto from '../model/projeto';
import pool from "./db";
import User from "../model/user";


export function getNomeProjeto(req: Request, res: Response) {
    const { analista } = req.body;

   
    const query = `
        SELECT DISTINCT a.nm_mun 
        FROM tb_aoi a 
        JOIN tb_grade_atuacao g ON ST_Intersects(a.geom, g.geom)
        WHERE g.atribuicao = $1;
    `;

    pool.query(query, [analista], (error, result) => {
        if (error) {
            console.error('Erro ao obter nome do projeto:', error);
            res.status(500).send('Erro ao obter nome do projeto');
        } else {
            
            if (result.rows.length > 0) {
                
                const nomesProjetos: string[] = result.rows.map(row => row.nm_mun);
                res.json({ nomesProjetos });
            } else {
                res.status(404).send('Projeto não encontrado');
            }
        }
    });
}

export function listarProjetos(req: Request, res: Response) {
    const {analista, municipio} = req.body;
    const query = `
        SELECT 
            g.*
        FROM tb_grade_atuacao g
        INNER JOIN tb_aoi a ON ST_Intersects(g.geom, a.geom)
        WHERE g.atribuicao = $1
        AND (
            a.nm_mun = $2
        );
    `;

    pool.query(query, [analista, municipio], (error, result) => {
        if (error) {
            console.error('Erro ao listar projetos:', error);
            res.status(500).send('Erro ao listar projetos');
        } else {
            res.json(result.rows);
        }
    });
}




