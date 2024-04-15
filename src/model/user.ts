class User {
     id: Number;
     name: String;
     email: String;
     senha: String;

    constructor(info:User){
        this.id = info.id;
        this.name = info.name;
        this.email = info.email;
        this.senha = info.senha;
    }

    
}


export default User