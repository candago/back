import { Request,Response } from "express";
import query from "./db";
import Grafico from "../model/grafico"

export async function criarGrafico(req:Request,res:Response){
    const grafico: Grafico = new Grafico('Tasks finalizadas por usuário ')
    const filtro = req.body.atribuicao
    grafico.setFiltro(filtro)
   const data = await query(`select  ${grafico.getFiltro(filtro)} union select count(status), sum(area_km2) from  tb_grade_atuacao where status = 'finalizado' ${grafico.getFiltro(filtro)}`)
   grafico.setData(data.rows)
   res.json(grafico)
}

export async function progressAreaPerUser(req:Request,res:Response){
    const result = await query(`select * from progressByAreaPerUser where name = '${req.body.city}'`)
    res.json(result)
}
