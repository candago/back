import { Request,Response } from "express";
import pool from "./db";
import User from "../model/user"

export function signup(req:Request, res:Response){
    const info: User = req.body;
    
    const user: User = new User(info);
    console.log(user)
    pool.query(`insert into usuarios values (${user.id},'${user.getSenha()}','${user.nome}','${user.getEmail()}')`)
    const response = `Usuário ${user.getNome()} cadastrado com sucesso!`;
    res.json(response)
}

export async function assign(req:Request, res:Response){
    const {info} = req.body;
    const idAssigned = await pool.query(`insert into tb_UserProjeto values (1, )    select nome from tb_user where email = ${info}`);
    
}

export async function getUserById(req:Request, res:Response){
    const userId = await pool.query(`select * from usuarios where id = 1`)
    res.json(userId.rows)
}
