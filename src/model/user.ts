class User {
     nome: String;
     protected email: String;
     protected senha: String;

    constructor(info:User){
        this.nome = info.nome;
        this.email = info.email;
        this.senha = info.senha;
    }

    getNome(): String{
        return this.nome
    }
    getSenha(): String{
        return this.senha
    } 
    getEmail(): String{
        return this.email
    } 
}


export default User