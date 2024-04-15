import { Request,Response } from "express";
import pool from "./db";
import User from "../model/user"

export async function signup(req:Request, res:Response){
    const info: User = req.body;
    const user: User = new User(info);
    await pool.query(`insert into tb_user values (${user.id},${user.name},${user.email},${user.senha})`)
    const response = `Usuário ${user.email} cadastrado com sucesso!`;
}

export async function assign(req:Request, res:Response){
    const {info} = req.body;
    const idAssigned = await pool.query(`insert into tb_UserProjeto values (1, )    select nome from tb_user where email = ${info}`);
    
}
