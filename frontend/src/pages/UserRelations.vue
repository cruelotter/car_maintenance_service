<script setup>
import HeaderTop from "@/components/HeaderTop";
import store from '@/store/index';
import {onMounted, ref} from "vue";


const relations = store.state.relations;

const technicians = ref();

onMounted(() => {
  fetch(`http://127.0.0.1:5000/techs`)
      .then(response => response.json())
      .then(data => {
        technicians.value = data;
        console.log(data);
      })

  fetch(`http://127.0.0.1:5000/relations`)
      .then(response => response.json())
      .then(data => {
        relations.value = data;
        console.log(data);
        store.commit('setRelations', data);
      })
  })
</script>

<template>
 <HeaderTop />
  <h2 class="mt-4">Relations management table</h2>
  <p>There you can add or change technicians relations.</p>
  <div class="d-flex justify-content-end me-5">
      <div class="d-flex flex-column align-items-start">
      <div>
        <label class="me-3" for="fname">Manager</label>
        <input v-model="manager" type="text" id="fname" name="name"><br><br>
      </div>
      <div>
        <label class="me-3" for="lname">Subordinate</label>
        <input v-model="subordinate" type="text" id="lname" name="desc"><br><br>
      </div>
        <button @click="addService">Add</button>
      </div>
  </div>


  <div class="mt-5 ms-5 me-5">
    <div class="mb-3 w-100">
      <div class="row mb-5 w-100">
        <div class="col-6 themed-grid-col fw-bold">Manager</div>
        <div class="col-5 themed-grid-col fw-bold">Subordinate</div>
      </div>
      <div v-for="(rel, idx) in relations" :key="idx" class="row mb-5 w-100">
        <div class="col-6 themed-grid-col">{{ technicians[rel[2]][1] }}</div>
        <div class="col-5 themed-grid-col">{{ technicians[rel[1]][1] }}</div>
        <svg @click="delService()" class="col-1" xmlns="http://www.w3.org/2000/svg"  width="10" height="10" viewBox="0 0 24 24"><path fill="none" stroke="#cc0000" stroke-linecap="round" stroke-width="2" d="M20 20L4 4m16 0L4 20"/></svg>
      </div>
    </div>
  </div>
</template>

<style scoped>
.bd-placeholder-img {
        height: 90vh;
        width: 80vw;
      }
</style>