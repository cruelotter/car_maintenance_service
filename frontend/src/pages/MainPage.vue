<script setup>
import {onMounted, ref} from "vue";
import HeaderTop from "@/components/HeaderTop";
const services = ref();

onMounted(() => {
  fetch('http://127.0.0.1:5000/getdb')
      .then(response => response.json())
      .then(data => {
        console.log(data);
        services.value = data;
      })})
</script>

<template>
  <HeaderTop />
  <h2 class="mt-4">Car maintenance service</h2>
  <p>There you can add, change or remove services, so they will change on the main page of the shop.</p>
  <div class="d-flex justify-content-end me-5">
    <button type="button" class="w-15 btn btn-lg btn-primary">Add Service</button>
  </div>

  <div class="mt-5 ms-5 me-5">
    <div class="mb-3 w-100">
      <div class="row mb-5 w-100">
        <div class="col-4 themed-grid-col fw-bold">Service name</div>
        <div class="col-4 themed-grid-col fw-bold">Description</div>
        <div class="col-4 themed-grid-col fw-bold">Cost</div>
      </div>
      <div v-for="serv in services" :key="serv[0]" class="row mb-5 w-100">
        <div class="col-4 themed-grid-col">{{ serv[1] }}</div>
        <div class="col-4 themed-grid-col">{{ serv[2] }}</div>
        <div class="col-4 themed-grid-col">100 рублей</div>
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