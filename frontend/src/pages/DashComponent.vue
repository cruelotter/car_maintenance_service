<script setup>
import {onMounted, ref} from "vue";
import HeaderTop from "@/components/HeaderTop";
import store from '@/store/index';

const dataPerformance = ref([]);

const getBack = () => {
    store.commit('setPage', 'dashboard');
}
const urls = ['total_revenue_per_month', 'report_on_most_popular_services', 'report_on_technician_performance', 'report_on_inventory_status', 'report_on_customer_feedback']

onMounted(() => {
  fetch(`http://127.0.0.1:5000/dashboards/${urls[store.state.dashId]}`)
      .then(response => response.json())
      .then(data => {
        console.log(data);
        dataPerformance.value = data;
      })})
</script>

<template>
  <HeaderTop />
  <div class="container-fluid">
  <div class="row">
    <div @click="getBack" class="">Back</div>
    <main class="col-md-14 ms-sm-auto col-lg-14 px-md-4">
      <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2">Dash Name</h1>
      </div>
      <div class="table-responsive">
        <table class="table table-striped table-sm">
          <thead>
            <tr v-if="dataPerformance[0]" >
              <th v-for="(item, idx) in dataPerformance[0].length" :key="idx">{{idx}}</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(item, idx) in dataPerformance" :key="idx">
              <td v-for="(item, index) in dataPerformance[idx]" :key="index">{{ item }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </main>
  </div>
</div>
</template>

<style scoped>

</style>