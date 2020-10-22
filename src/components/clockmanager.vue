<template>
  <div class="clockmanager">
    <h1>ClockManager</h1>
    <button type="button" class="btn btn-secondary btn-lg" v-on:click="clock()">
      <span v-if="clockIn">Work period in progress...</span>
      <span v-else>Start of work</span>
    </button>
    <p>
      <span v-if="clockIn || startDateTime !==null">Start at : {{ startDateTime }} </span>
    </p>
  </div>
</template>

<script>
import moment from 'moment';
//import axios from 'axios';
export default {

  name: 'clockmanager',
  props: ['username'],
  data() {
    return {
      startDateTime: null,
      clockIn : false,
      error : false,
      refreshOn: null
    }
  },
  methods: {
      refresh : function() {
        // let userID = null;
        // axios
        // .get("http://localhost:4000/api/users" ,{params: {username: this.username}})
        // .then(response => userID = response.userID , this.error=true);

        // if (!this.error) {
        //   let clock = null;
        //   axios
        //   .get("http://localhost:4000/api/clocks/" + userID )
        //   .then(response => clock = response , this.error=true);
        // }
        
        // this.startDateTime = moment(clock.time).format('LLLL');
        // this.clockIn = clock.status

        // Mock
        
        this.startDateTime = moment('2020-12-12 12:12:12').format('LLLL');
        this.clockIn = true
      },

      clock() {
        this.clockIn = !this.clockIn
        if (this.startDateTime === null) {
          moment.locale('fr');  
          this.startDateTime = moment().format('LLLL');
        }
        else {
          this.startDateTime = null;
        }
      },
  },
  created() {
    this.refresh()
    this.refreshOn = setInterval(
      this.refresh
      , 1000);
  },

  destroyed() {
    if (this.refreshOn !==null) {
      clearInterval(this.refreshOn);
    }
  }


}
</script>

<style scoped></style>