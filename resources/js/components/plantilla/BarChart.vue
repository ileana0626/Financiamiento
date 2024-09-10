<template>
    <Bar
      :chartOptions="chartOptions"
      :chartData="chartData"      
    ></Bar>
  </template>

  <script>
  import { Bar } from 'vue-chartjs'
  import { Chart as ChartJS, Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale } from 'chart.js'

  ChartJS.register(Title, Tooltip, Legend, BarElement, CategoryScale, LinearScale)

  export default {
    props:[
        'data',
        'options'
    ],
    name: 'BarChart',
    components: { Bar },
    computed: {
      chartData() { return this.data },

      chartOptions() { return this.options }
      
    },
    mounted(){
    },
  }
  </script>
