<script setup>
import {onMounted, ref} from "vue";
import HeaderTop from "@/components/HeaderTop";
const services = ref();

let service = '';
let desc = '';
let cost = '';

onMounted(() => {
  fetch('http://127.0.0.1:5000/getdb')
      .then(response => response.json())
      .then(data => {
        console.log(data);
        services.value = data;
      })})

const addService = async () => {
  await fetch('http://127.0.0.1:5000/addservice', {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json;charset=utf-8'
                },
                body: JSON.stringify([services.value[services.value.length-1][0]+1, service, desc, cost])
  })

  await fetch('http://127.0.0.1:5000/getdb')
      .then(response => response.json())
      .then(data => {
        services.value = data;
      })
}

const delService = async (id) => {
  await fetch('http://127.0.0.1:5000/deleteservice', {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json;charset=utf-8'
                },
                body: JSON.stringify(id)
  })

  await fetch('http://127.0.0.1:5000/getdb')
      .then(response => response.json())
      .then(data => {
        services.value = data;
      })
}

</script>

<template>
  <HeaderTop />
  <h2 class="mt-4">Car maintenance service</h2>
  <p>There you can add, change or remove services, so they will change on the main page of the shop.</p>
  <div class="d-flex justify-content-end me-5">
      <div class="d-flex flex-column align-items-start">
      <div>
        <label class="me-3" for="fname">Services:</label>
        <input v-model="service" type="text" id="fname" name="name"><br><br>
      </div>
      <div>
        <label class="me-3" for="lname">Descrbe:</label>
        <input v-model="desc" type="text" id="lname" name="desc"><br><br>
      </div>
      <div>
        <label class="me-3" for="lname">Set cost:</label>
        <input v-model="cost" type="text" id="lname" name="cost"><br><br>
      </div>
        <button @click="addService">Add</button>
      </div>
  </div>


  <div class="mt-5 ms-5 me-5">
    <div class="mb-3 w-100">
      <div class="row mb-5 w-100">
        <div class="col-4 themed-grid-col fw-bold">Service name</div>
        <div class="col-4 themed-grid-col fw-bold">Description</div>
        <div class="col-3 themed-grid-col fw-bold">Cost</div>
      </div>
      <div v-for="(serv, idx) in services" :key="idx" class="row mb-5 w-100">
        <div class="col-4 themed-grid-col">{{ serv[1] }}</div>
        <div class="col-4 themed-grid-col">{{ serv[2] }}</div>
        <div class="col-3 themed-grid-col">{{ `${serv[3]}$` }}</div>
        <svg @click="delService(serv[0])" class="col-1" xmlns="http://www.w3.org/2000/svg"  width="10" height="10" viewBox="0 0 24 24"><path fill="none" stroke="#cc0000" stroke-linecap="round" stroke-width="2" d="M20 20L4 4m16 0L4 20"/></svg>
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