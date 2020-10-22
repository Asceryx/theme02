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
        :data="dataValue"
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
        :data="dataValue" 
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
        :data="dataValue"
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
import axios from 'axios';
import moment from 'moment';

export default {
  name: 'chartmanager',
  props: ['userid'],
  data() {
    return {
      selected : "line-chart",
      error : false,
      dataValue: [],
      charts : [
        'line-chart',
        'bar-chart',
        'area-chart'
      ]
    }
  },
  methods: {
    jsonToObject(jsonData) {
      jsonData.data.forEach(element => {
        this.dataValue.push({date: moment(element.start).format('YYYY-MM-DD'), value: this.parseData(element)});
      });
    },

    interval(startTime, endTime) {
      const dt1 = moment(endTime).unix();
      const dt2 = moment(startTime).unix();
      var diff = (parseInt(dt2) - parseInt(dt1));
      diff /= (60 * 60);
      return diff;
    },

    parseData(data) {
      return { 
        date: moment(data.start).format('YYYY-MM-DD'),
        value: this.interval(data.start, data.end)
      }
    },

    retrieveWorktimes () {
      axios
      .get("/api/workingtimes/" + this.userid)
      .then(response => this.data = this.jsonToObject(response.data), this.error=true);
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