<template>
    <Doughnut
      :chartOptions="chartOptions"
      :chartData="chartData"
    ></Doughnut>
  </template>

  <script>
  import { Doughnut } from 'vue-chartjs'
  import { Chart as ChartJS, ArcElement, Tooltip, Legend } from 'chart.js'

  ChartJS.register(ArcElement, Tooltip, Legend)

  export default {
    props:[
        'data',
        'options'
    ],
    name: 'DoughnutChart',
    components: { Doughnut },
    computed: {
      chartData() { return this.data },

      chartOptions() { return this.options }

    },
    mounted(){
    }
  }
  </script>
