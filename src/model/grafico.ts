import { Query } from "pg";
import { QueryResult } from "typeorm";

class Grafico{
    titulo: string;
    filtro?: string;
    dados?: any[];

    constructor(titulo: string, dados?: any[], filtro?:string){
        this.titulo = titulo;
        this.dados = dados;
        this.filtro = filtro
    }

    public setFiltro(filtro:string){
        this.filtro = filtro;
    }

    public setData(data: any[]){
        this.dados = data
    }

    public getFiltro(filtro:string):string | undefined{
        return `and atribuicao = '${this.filtro}'` ;
    }

}

export default Grafico
