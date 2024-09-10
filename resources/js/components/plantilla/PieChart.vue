<template>
    <Pie      
      :chartOptions="chartOptions"
      :chartData="chartData"
    ></Pie>
  </template>

  <script>
  import { Pie } from 'vue-chartjs'
  import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js'

  ChartJS.register(ArcElement, Tooltip, Legend)

  export default {
    props:[
        'data',
        'options'
    ],
    name: 'PieChart',
    components: { Pie },
    computed: {
      chartData() { return this.data },

      chartOptions() { return this.options }

    },
    mounted(){
    }
  }
  </script>
