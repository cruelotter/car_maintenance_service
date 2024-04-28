<script setup>
import HeaderTop from "@/components/HeaderTop";
import {onMounted, ref} from "vue";

const pics = ref([]);
let chosen = 0;

onMounted(() => {
  fetch('http://127.0.0.1:5000/pics')
      .then(response => response.json())
      .then(data => {
        pics.value = data;
      })})
</script>

<template>
  <HeaderTop />
  <div id="myCarousel" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
      <button type="button" data-bs-target="#myCarousel" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner">
      <div v-for="(items, idx) in pics" :key="idx" class="carousel-item" :class="`${chosen === idx ? 'active' : ''}`">
        <img :src="pics[idx]" alt="background" class="bd-placeholder-img" width="100%" height="90vh">

        <div class="container">
          <div class="carousel-caption text-start">
            <h1>Example headline.</h1>
            <p>Some representative placeholder content for the first slide of the carousel.</p>
          </div>
        </div>
      </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#myCarousel" data-bs-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#myCarousel" data-bs-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="visually-hidden">Next</span>
    </button>
  </div>
</template>

<style scoped>
.bd-placeholder-img {
        height: 90vh;
        width: 80vw;
      }
</style>