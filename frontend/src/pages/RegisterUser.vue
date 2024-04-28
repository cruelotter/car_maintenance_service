<script setup>
import {onMounted, ref} from "vue";
import HeaderTop from "@/components/HeaderTop";

const users = ref([]);
let login = '';
let password = '';
let role = 0;

onMounted(() => {
  fetch(`http://127.0.0.1:5000/users`)
      .then(response => response.json())
      .then(data => {
        users.value = data;
      })})
const addUser = async () => {
  console.log(role);
  await fetch('http://127.0.0.1:5000/adduser', {
                method: 'POST',
                headers: {
                  'Content-Type': 'application/json;charset=utf-8'
                },
                body: JSON.stringify([users.value[users.value.length-1][0]+1, users.value[users.value.length-1][0]+1, login, password, role])
              
  }).then(() => alert('User added successfully!'))
}
</script>

<template>
    <HeaderTop />
    <div class="row g-5 d-flex flex-column align-items-center">

      <div class="col-md-7 col-lg-8">
        <h4 class="mb-3">User registration</h4>
        <form class="needs-validation" novalidate>
          <div class="row g-3">
            <div class="col-sm-6 mb-5">
              <label for="firstName" class="form-label">First name</label>
              <input type="text" class="form-control" id="firstName" placeholder="" value="" required>
              <div class="invalid-feedback">
                Valid first name is required.
              </div>
            </div>
            <div class="col-sm-6">
              <label for="lastName" class="form-label">Last name</label>
              <input type="text" class="form-control" id="lastName" placeholder="" value="" required>
              <div class="invalid-feedback">
                Valid last name is required.
              </div>
            </div>
          </div>


            <div class="col-12 mb-5">
              <label for="username" class="form-label">Username</label>
              <div class="input-group has-validation">
                <span class="input-group-text">@</span>
                <input v-model="login" type="text" class="form-control" id="username" placeholder="Username" required>
              <div class="invalid-feedback">
                  Your username is required.
                </div>
              </div>
            </div>

            <div class="col-12 mb-5">
              <label for="email" class="form-label">Password</label>
              <input v-model="password" type="email" class="form-control" id="email" placeholder="Password">
            
            </div>

            <div class="col-md-4 mb-5">
              <label for="state" class="form-label">Role</label>
              <select v-model="role" class="form-select" id="state" required>
                <option value="0">Choose role</option>
                <option value="1">Admin</option>
                <option value="2">Manager</option>
                <option value="3">Technician</option>
              </select>
              <div class="invalid-feedback">
                Please provide a valid state.
              </div>
            </div>

          <div @click="addUser" class="w-100 btn btn-primary btn-lg">Save</div>
        </form>
      </div>
    </div>
</template>

<style scoped>
.bd-placeholder-img {
        height: 90vh;
        width: 80vw;
      }
</style>