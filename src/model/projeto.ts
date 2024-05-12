// Projeto.ts

import User from "./user";

class Projeto {
    nomeProjeto: String; //nm_mun tbaoi
    gradeProjeto: String; // tb_grade_atuacao
    id: number; //tb_grade_atuacao
    atribuicao: User; //tb_grade_atuacao
    status: string; //tb_grade_atuacao
    validacao: string; //tb_grade_atuacao
    status_val: string; //tb_grade_atuacao
    obs: string; //tb_grade_atuacao
    area_km2: number; //tb_grade_atuacao
    geom: any; //tb_grade_atuacao



    constructor(
        nomeProjeto: string,
        gradeProjeto: string,
        id: number,
        user: User,
        status: string,
        validacao: string,
        status_val: string,
        obs: string,
        area_km2: number,
        geom: any
    ) {
        this.nomeProjeto = nomeProjeto;
        this.gradeProjeto = gradeProjeto;
        this.id = id;
        this.atribuicao = user;
        this.status = status;
        this.validacao = validacao;
        this.status_val = status_val;
        this.obs = obs;
        this.area_km2 = area_km2;
        this.geom = geom;
    }


}

export default Projeto;
