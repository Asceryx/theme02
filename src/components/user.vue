<template>
  <div class="user">
    <h1 v-if="affichage">User</h1>
    <h2 v-if="affichage">Renseignez les champs suivants:</h2>  
    <p1 v-if="affichage">
      Email: <br> <input v-if="affichage" v-model="mail" placeholder=""><br>
      Nom d'utilisateur: <br> <input v-if="affichage" v-model="username" placeholder=""><br><br>
      <button v-if="affichage" v-on:click="getuser">S'identifier</button> <button v-if="affichage" v-on:click="createUser">S'inscrire</button>
      </p1>
      <h2 v-if="active">Bienvenue: {{responseUser.username}}</h2>

      <br>
      <button v-if="active" v-on:click="update">Modifier utilisateur</button><br><br>
      <button v-if="active" v-on:click="logOut">Se déconnecter</button><br><br>
      <button v-if="active" v-on:click="deleteUser">Supprimer utilisateur</button>
      <p2 v-if='activeB'> Nouveau nom d'utilisateur: <br> <input v-if="activeB" v-model="username" placeholder=""><br><br>
      <button v-if="activeB" v-on:click="updateUser">Changer</button><br><br><br><br>
      </p2>
      
  

  </div>
</template>

<script>
import axios from 'axios';
export default {
  name: 'user',
  data: function() {
    return{
        mail:'',
        username:'',
        userID: '0',
        active:false, 
        affichage: true,
        activeB:false,
        responseUser:''
      }
  },
  methods: {
      logOut() {
        this.affichage = true
        this.active = false
        this.activeB = false
      },
      getuser() {
        axios
        .get("/api/users?email=" + this.mail + "&username=" + this.username)
        .then(response => this.responseUser = response.data.data)
        this.userID = this.responseUser.id;
        this.affichage = !(this.userID != 0);
        this.active = this.userID != 0;
        } ,
      createUser() {
        axios
        .post("/api/users/", {
          'user':{
            'username':this.username,
            'email' :this.mail
            }
          })
        .then(response => this.responseUser = response.data.data)
      },
      updateUser() {
        axios
        .put("/api/users/"+ this.responseUser.id, {'user':{'username':this.username}})
        .then(response => this.responseUser = response.data.data)
        this.affichage = !(this.userID != 0);
        this.active = this.userID != 0;
        this.activeB = false;
      },
      update() {
        this.active = false;
        this.activeB = true;
      },
      deleteUser() {
        axios
        .delete("/api/users/"+ this.responseUser.id)
        .then(response => this.responseUser = response.data.data)
        this.affichage = true
        this.active = false
        this.activeB = false
          
      }
  },
}
</script>

<style scoped>
h1 {
  color: rgb(0, 0, 0);
  padding-bottom: 20px;

}
h2{
  font-size: 30px;
  color: rgb(17, 58, 238);
}
</style>