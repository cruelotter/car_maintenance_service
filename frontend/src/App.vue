<script setup>
import { ref, onMounted } from 'vue'

const pictures = ref();

onMounted(() => {
  fetch('http://127.0.0.1:5000/pics')
      .then(response => response.json())
      .then(data => {
        pictures.value = data;
      });

  fetch('http://127.0.0.1:5000/getdb')
      .then(response => response.json())
      .then(data => {
        pictures.value = data;
      })})



</script>
<template>

    <header class="d-flex justify-content-center py-3">
      <ul class="nav nav-pills">
        <li class="nav-item"><a href="#" class="nav-link active" aria-current="page">Home</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Features</a></li>
        <li class="nav-item"><a href="#" class="nav-link">Pricing</a></li>
        <li class="nav-item"><a href="#" class="nav-link">FAQs</a></li>
        <li class="nav-item"><a href="#" class="nav-link">About</a></li>
      </ul>
    </header>
    <h2 class="mt-4">Car maintenance service</h2>
    <p>Описать, как это вообще все на сайте работает</p>

    <div class="d-flex mt-5 ms-5 me-5">
      <div class="d-flex flex-column flex-shrink-0 p-3 bg-light" style="width: 280px;">
        <ul class="nav nav-pills flex-column mb-auto">
          <li class="nav-item">
            <a href="#" class="nav-link active" aria-current="page">
              Home
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
          <li>
            <a href="#" class="nav-link link-dark">
              Products
            </a>
          </li>
          <li>
            <a href="#" class="nav-link link-dark">
              Customers
            </a>
          </li>
        </ul>
      </div>
      <div class="mb-3 w-100">
        <div class="row mb-5 w-100">
          <div class="col-4 themed-grid-col">Название услуги</div>
          <div class="col-4 themed-grid-col">Тип услуги</div>
          <div class="col-4 themed-grid-col">Стоимость</div>
        </div>
        <div class="row mb-5 w-100">
          <div class="col-4 themed-grid-col">Клининг</div>
          <div class="col-4 themed-grid-col">Внутренний</div>
          <div class="col-4 themed-grid-col">100 рублей</div>
        </div>
        <div class="row mb-5 w-100">
          <div class="col-4 themed-grid-col">Название услуги</div>
          <div class="col-4 themed-grid-col">Тип услуги</div>
          <div class="col-4 themed-grid-col">Стоимость</div>
        </div>
        <div class="row mb-5 w-100">
          <div class="col-4 themed-grid-col">Название услуги</div>
          <div class="col-4 themed-grid-col">Тип услуги</div>
          <div class="col-4 themed-grid-col">Стоимость</div>
        </div>
        <div class="row mb-5 w-100">
          <div class="col-4 themed-grid-col">Название услуги</div>
          <div class="col-4 themed-grid-col">Тип услуги</div>
          <div class="col-4 themed-grid-col">Стоимость</div>
        </div>
      </div>
    </div>
  <img v-for="(el, index) in pictures" :key="index" :src="el">
</template>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}
</style>
