<script setup>
import store from '@/store/index';

const main = () =>{
  store.commit('setPage', 'main')
}

const dashboard = () =>{
  store.commit('setPage', 'dashboard')
}

const orders = () =>{
  store.commit('setPage', 'orders')
}

</script>
<template>
  <header class="d-flex justify-content-center py-3">
    <ul class="nav nav-pills">
      <li class="nav-item" @click="main"><div class="nav-link" :class="`${store.state.page === 'main' ? 'active' : ''}`" aria-current="page">Services</div></li>
      <li class="nav-item" @click="dashboard"><div class="nav-link" :class="`${store.state.page === 'dashboard' ? 'active' : ''}`">Dashboard</div></li>
      <li class="nav-item" @click="orders"><div class="nav-link" :class="`${store.state.page === 'orders' ? 'active' : ''}`">Orders</div></li>
    </ul>
  </header>
</template>

<style scoped>

</style>