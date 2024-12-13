<template>
    <button class="tabItem" :class="active ? 'borderActive' : ''">
      <span>{{ title }}</span>
    </button>
  </template>
  <script>
  export default {
    props: ['title', 'active'],
    data() {
      return {
        //activeName: 'first'
      }
    },
  }
  </script>
  <style>
  .tabItem {
    padding: 10px 30px;
    height: 3.225rem;
    font-weight: bold;
    font-size: 18px;
    border: 2px solid transparent;
    transition: all 0.1s ease-in;
    background: var(--iee-white);
    z-index: 10;
    text-wrap: nowrap;
  }
  
  .tabItem:focus {
    transition: all 0.1s ease-in;
  }
  
  .tabItem:hover {
    background-color: var(--iee-white);
  }
  
  .borderActive {
    border-bottom: 4px solid var(--dorado);
    background: var(--iee-white);
  }
  
  @media screen and (max-width: 637px) {
    .borderActive {
      border-bottom: none;
      background-color: var(--iee-white);
    }
    .tabItem:hover {
      background-color: var(--iee-white);
    }
    .tabItem {
      background-color: var(--iee-white);
    }
  }
  </style>