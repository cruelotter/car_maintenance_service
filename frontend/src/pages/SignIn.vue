<script setup>
import {onMounted, ref} from "vue";
import store from '@/store/index';

let login = '';
let password = '';
const auth = ref([]);

onMounted(() => {
  fetch(`http://127.0.0.1:5000/login`)
      .then(response => response.json())
      .then(data => {
        console.log(data);
        auth.value = data;
      })})

const reg =  () => {
      for (let i=0; i < auth.value.length; i++){
          if (auth.value[i].indexOf(login) !== -1 && auth.value[i].indexOf(password) !== -1) {store.commit('setRole', auth.value[i][4]); store.commit('setPage', 'main'); return}
      }
      alert("Wrong user data")
    }
      


</script>

<template>
  <main class="form-signin text-center">
    <form class="mt-100 d-flex flex-column align-items-center">
      <h1 class="h3 mb-3 fw-normal mb-5">Please sign in</h1>

      <div class="form-floating w-25 mb-5">
        <input v-model="login" type="login" class="form-control" id="floatingInput" placeholder="name@example.com">
        <label for="floatingInput">Email address</label>
      </div>
      <div class="form-floating w-25 mb-5">
        <input v-model="password" type="password" class="form-control" id="floatingPassword" placeholder="Password">
        <label for="floatingPassword">Password</label>
      </div>

      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
      <div class="w-15">
        <button @click="reg" class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
      </div>

      <p class="mt-5 mb-3 text-muted">&copy; 2022–2024</p>
    </form>
  </main>
</template>



<style scoped>
.mt-100{
  margin-top: 120px;
}
.w-15{
  width: 15%;
}
</style>