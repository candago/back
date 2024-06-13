import { Request, Response } from 'express';
import query from "./db";


export async function getNomeProjeto(req: Request, res: Response) {
    const { analista } = req.body;

    let result = await query( `
        SELECT DISTINCT a.nm_mun 
        FROM tb_aoi a 
        JOIN tb_grade_atuacao g ON ST_Intersects(a.geom, g.geom)
        WHERE g.atribuicao = ${analista};`);
    if (result.rows.length > 0) {
        const nomesProjetos: string[] = result.rows.map((row: { nm_mun: any; }) => row.nm_mun);
        res.json({ nomesProjetos });
    } else {
        res.status(404).send('Projeto não encontrado');
    }

}

export async function listarProjetos(req: Request, res: Response) {
    const {analista, municipio} = req.body;
    let result = await query( `
        SELECT 
            g.*
        FROM tb_grade_atuacao g
        INNER JOIN tb_aoi a ON ST_Intersects(g.geom, a.geom)
        WHERE g.atribuicao = ${analista}
        AND (
            a.nm_mun = ${municipio}
        );
    `);
    if (result.rows.length > 0) {
        const nomesProjetos: string[] = result.rows.map((row: { nm_mun: any; }) => row.nm_mun);
        res.json({ nomesProjetos });
    } else {
        res.status(404).send('Projeto não encontrado');
    }
}




