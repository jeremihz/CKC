export default class Gate {

    constructor (user){
        this.user =user;
    }
    isAdmin(){
        return this.user.type === 'admin';
    }
    isPastor(){
        return this.user.type === 'pastor';
    }
    isGuest(){
        return this.user.type === 'guest';
    }
}