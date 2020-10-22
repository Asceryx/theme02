<template>
  <div class="chartmanager">
    <h1>ChartManager</h1>
    <h3>Choix de l'affichage</h3>
    <select v-model="selected">
      <option v-for="chart in charts" v-bind:key="chart" v-bind:value="chart">{{ chart }}</option> 
    </select>
    <div v-if="selected === 'line-chart'">
      <line-chart 
        id="line" 
        :data="data"
        xkey="date"
        resize="true"
        ykeys='["value"]'
        labels='["Hours of works"]'
        line-colors='["#576277"]'
        hide-hover="auto"
        xLabels="day">
      </line-chart>
    </div>

    <div v-if="selected === 'bar-chart'">
      <bar-chart 
        id="bar" 
        :data="data" 
        xkey="date" 
        ykeys='[ "value" ]' 
        resize="true"
        labels='[ "Hours of works" ]' 
        bar-colors='[ "#FF6384" ]'
        grid="true" 
        grid-text-weight="bold">
      </bar-chart>
    </div>

    <div v-if="selected === 'area-chart'">
      <area-chart
        id="area"
        :data="data"
        xkey="date" 
        ykeys='[ "value" ]' 
        line-colors='[ "#FF6384"]' 
        grid="true"
        grid-text-weight="bold"
        resize="true">
      </area-chart>
    </div>
  </div>
</template>

<script>
import { LineChart, BarChart, AreaChart } from 'vue-morris'
//import axios from 'axios';

export default {
  name: 'chartmanager',
  props: ['userid'],
  data() {
    return {
      selected : "line-chart",
      error : false,
      data: [],
      charts : [
        'line-chart',
        'bar-chart',
        'area-chart'
      ]
    }
  },
  methods: {
    jsonToObject(jsonData) {
      return jsonData.map(data => this.parseData(data));
    },

    interval(startTime, endTime) {
      const dt1 = new Date(endTime).format('YYYY-MM-DD hh:mm:ss') 
      const dt2 = new Date(startTime).format('YYYY-MM-DD hh:mm:ss');
      var diff =(dt2.getTime() - dt1.getTime()) / 1000;
      diff /= (60 * 60);
      return Math.abs(Math.round(diff));
    },

    parseData(data) {
      const startDate = new Date(data.start).format('YYYY-MM-DD hh:mm:ss')
      return { 
        date: startDate.getYear() + '-' + startDate.getMonth() + '-' + startDate.getDay(),
        value: this.interval(data.start, data.end)
      }
    },

    retrieveWorktimes () {
      // axios
      // .get("", {params: {user_id: this.userid}})
      // .then(response => this.data = this.jsonToObject(response), this.error=true);
      this.data = [
        { date: '2019-08-01', value: 20},
        { date: '2019-08-02', value: 15},
        { date: '2019-08-03', value: 23},
        { date: '2019-08-04', value: 13},
        { date: '2019-08-05', value: 12}, 
        { date: '2019-08-06', value: 10}, 
        { date: '2019-08-07', value: 11}, 
        { date: '2019-08-08', value: 15}, 
        { date: '2019-08-09', value: 6},
        { date: '2019-08-10', value: 3}, 
        { date: '2019-08-11', value: 30}, 
        { date: '2019-08-12', value: 4}, 
        { date: '2019-08-13', value: 1}, 
        { date: '2019-08-14', value: 2}, 
      ]
    }
  },
  components: { 
    LineChart,
    BarChart,
    AreaChart
  },

  created() {
    this.retrieveWorktimes(); 
  }
    

} 
</script>

<style scoped>
.small {
    max-width: 600px;
    margin:  150px auto;
  }
</style>