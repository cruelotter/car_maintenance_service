<script setup>
import HeaderTop from "@/components/HeaderTop";
import store from '@/store/index';

const dashboards1 = [
  {
    name: 'Report on total revenue per month',
    description: 'Report on total revenue per month description',
    id: 0
  },
  {
    name: 'Report on most popular services',
    description: 'Report on most popular services description',
    id: 1
  },
  {
    name: 'Report on technician performance',
    description: 'Report on technician performance description',
    id: 2
  },
]

const dashboards2 = [
  {
    name: 'Report on inventory status',
    description: 'Report on inventory status description',
    id: 3
  },
  {
    name: 'Report on customer feedback',
    description: 'Report on customer feedback description',
    id: 4
  },
  {
    name: 'Report on technician performance',
    description: 'Report on technician performance description',
    id: 5
  },
]

const changeDash = (id, name) => {
    store.commit('setPage', 'dashboard-component');
    store.commit('setDashId', id);
    store.commit('setDashName', name);
}
</script>

<template>
  <HeaderTop />
  <h2 class="mt-4 fw-bols mb-5">Dashboards</h2>
  <p class="mb-5">Get reports on different spheres</p>

    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center ms-5 me-5">
      <div v-for="(dash, idx) in dashboards1" :key="idx" class="col">
        <div class="card mb-4 rounded-3 shadow-sm">
          <div class="card-header py-3">
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title mb-3">{{ dash.name }}</h1>
            <div class="mb-3">{{ dash.description }}</div>
            <button @click="changeDash(dash.id, dash.name)" type="button" class="w-50 btn btn-lg btn-outline-primary">Explore</button>
          </div>
        </div>
      </div>
    </div>

    <div class="row row-cols-1 row-cols-md-3 mb-3 text-center ms-5 me-5">
      <div v-for="(dash, idx) in dashboards2" :key="idx" class="col">
        <div class="card mb-4 rounded-3 shadow-sm">
          <div class="card-header py-3">
          </div>
          <div class="card-body">
            <h1 class="card-title pricing-card-title mb-3">{{ dash.name }}</h1>
            <div class="mb-3">{{ dash.description }}</div>
            <button @click="changeDash(dash.id, dash.name)" type="button" class="w-50 btn btn-lg btn-outline-primary">Explore</button>
          </div>
        </div>
      </div>
    </div>
</template>



<style scoped>
.mt-100{
  margin-top: 120px;
}
.w-15{
  width: 15%;
}
</style>