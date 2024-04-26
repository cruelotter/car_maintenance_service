<script setup>
import {onMounted, ref} from "vue";
import HeaderTop from "@/components/HeaderTop";

const pictures = ref();
const services = ref();

onMounted(() => {
  fetch('http://127.0.0.1:5000/pics')
      .then(response => response.json())
      .then(data => {
        pictures.value = data;
      });

  fetch('http://127.0.0.1:5000/getdb')
      .then(response => response.json())
      .then(data => {
        services.value = data;
      })})
</script>

<template>
  <HeaderTop />
  <h2 class="mt-4">Car maintenance service</h2>
  <p>Описать, как это вообще все на сайте работает</p>

  <div class="d-flex mt-5 ms-5 me-5">
    <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
      <ul class="nav nav-pills flex-column mb-auto">
        <li class="nav-item">
          <a href="#" class="nav-link active" aria-current="page">
            Services
          </a>
        </li>
        <li>
          <a href="#" class="nav-link link-dark">
            Dashboard
          </a>
        </li>
        <li>
          <a href="#" class="nav-link link-dark">
            Orders
          </a>
        </li>
      </ul>
    </div>
    <div class="mb-3 w-100">
      <div class="row mb-5 w-100">
        <div class="col-4 themed-grid-col">Название услуги</div>
        <div class="col-4 themed-grid-col">Описание</div>
        <div class="col-4 themed-grid-col">Стоимость</div>
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