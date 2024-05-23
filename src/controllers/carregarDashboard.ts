import { Request,Response } from "express";

export async function dashboard(req:Request, res:Response){
    const {dashboard} = req.body;
    const response = `redirecionado para ${dashboard}`
    res.json(response);
}