<template>
  <div id="app">
    <b-nav tabs>
      <b-nav-item v-bind:active="tab === 1" v-on:click="tab = 1">
        <router-link v-bind:to="{ name: 'workingtimes' , params: { userID: 'user' }}">Workingtimes</router-link>
      </b-nav-item>
      <b-nav-item v-bind:active="tab === 2" v-on:click="tab = 2">
        <router-link v-bind:to="{ name: 'workingtime' , params: { userid: 'user', workingtimeid: 'workingtimeid'}}">Workingtime</router-link>
      </b-nav-item>
      <b-nav-item v-bind:active="tab === 3" v-on:click="tab = 3">
        <router-link v-bind:to="{ name: 'clockmanager' , params: { username: 'user' }}">ClockManager</router-link>
      </b-nav-item>
      <b-nav-item v-bind:active="tab === 4" v-on:click="tab = 4">
        <router-link v-bind:to="{ name: 'chartmanager' , params: { userid: 'user' }}">ChartManager</router-link>
      </b-nav-item>
    </b-nav>

    <user></user>
    
    <router-view></router-view>
  </div>
</template>

<script>
import user from './components/user.vue'

export default {
  name: 'App',
  components: {
    user
  },
  data: function() {
    return {
      tab:1
    }
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
