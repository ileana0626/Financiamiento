<template>
  <LineChartGenerator
    :chart-options="chartOptions"
    :chart-data="chartData"
  />
</template>

<script>
import { Line as LineChartGenerator } from 'vue-chartjs/legacy'

import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  LineElement,
  LinearScale,
  CategoryScale,
  PointElement
} from 'chart.js'

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  LineElement,
  LinearScale,
  CategoryScale,
  PointElement
)

export default {
    props:[
        'data',
        'options'
    ],
    name: 'LineChart',
    components: { LineChartGenerator },
    computed: {
      chartData() { return this.data },

      chartOptions() { return this.options }

    },
    mounted(){
    }
  }
  </script>
