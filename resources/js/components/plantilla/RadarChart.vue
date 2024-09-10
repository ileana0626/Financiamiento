<template>
  <Radar
    :chartOptions="chartOptions"
    :chartData="chartData"
  ></Radar>
</template>
<script lang="ts">

import {
  Chart as ChartJS,
  RadialLinearScale,
  PointElement,
  LineElement,
  Filler,
  Tooltip,
  Legend
} from 'chart.js'
import { Radar } from 'vue-chartjs'

ChartJS.register(
  RadialLinearScale,
  PointElement,
  LineElement,
  Filler,
  Tooltip,
  Legend
)

export default {
    props:[
        'data',
        'options'
    ],
    name: 'RadarChart',
    components: { Radar },
    computed: {
      chartData() { return this.data },

      chartOptions() { return this.options }

    },
    mounted(){
    }
  }
  </script>
