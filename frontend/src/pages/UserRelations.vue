<script setup>
import HeaderTop from "@/components/HeaderTop";
import {onMounted, ref} from "vue";

let manager = '';
let subordinate = '';
const relations = ref();

const technicians = ref();

onMounted(() => {
  fetch(`http://127.0.0.1:5000/techs`)
      .then(response => response.json())
      .then(data => {
        technicians.value = data;
        console.log(data);
      })

  })

  const loadUsers = () => {
    fetch(`http://127.0.0.1:5000/relations`)
      .then(response => response.json())
      .then(data => {
        relations.value = data;
        console.log(data);
      })
  }

  const addRelation = async () => {
    await fetch('http://127.0.0.1:5000/addrelation', {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json;charset=utf-8'
                },
                body: JSON.stringify([relations.value.length+1, subordinate, manager])
              
  }).then(() => alert('User added successfully!'))

    await fetch('http://127.0.0.1:5000/relations')
      .then(response => response.json())
      .then(data => {
        relations.value = data;
      })
  }
</script>

<template>
 <HeaderTop />
  <h2 class="mt-4">Relations management table</h2>
  <p>There you can add or change technicians relations.</p>
  <div @click="loadUsers">Load Users</div>

  <div class="d-flex justify-content-end me-5">
      <div class="d-flex flex-column align-items-start">
      <div>
        <label class="me-3" for="fname">Manager id</label>
        <input v-model="manager" type="text" id="fname" name="name"><br><br>
      </div>
      <div>
        <label class="me-3" for="lname">Subordinate</label>
        <input v-model="subordinate" type="text" id="lname" name="desc"><br><br>
      </div>
        <button @click="addRelation">Add</button>
      </div>
  </div>


  <div class="mt-5 ms-5 me-5">
    <div class="mb-3 w-100">
      <div class="row mb-5 w-100">
        <div class="col-6 themed-grid-col fw-bold">Manager an</div>
        <div class="col-6 themed-grid-col fw-bold">Subordinate</div>
      </div>
      <div v-for="(rel, idx) in relations" :key="idx" class="row mb-5 w-100">
        <div class="col-6 themed-grid-col">{{ technicians[rel[2]-1][1] }}</div>
        <div class="col-6 themed-grid-col">{{ technicians[rel[1]-1][1] }}</div>
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