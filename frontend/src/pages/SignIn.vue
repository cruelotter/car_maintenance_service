<script setup>
import store from '@/store/index';
const signin = () =>{
  store.commit('setPage', 'main')
}

</script>

<template>
  <main class="form-signin text-center">
    <form class="mt-100 d-flex flex-column align-items-center">
      <h1 class="h3 mb-3 fw-normal mb-5">Please sign in</h1>

      <div class="form-floating w-25 mb-5">
        <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
        <label for="floatingInput">Email address</label>
      </div>
      <div class="form-floating w-25 mb-5">
        <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
        <label for="floatingPassword">Password</label>
      </div>

      <div class="checkbox mb-3">
        <label>
          <input type="checkbox" value="remember-me"> Remember me
        </label>
      </div>
      <div class="w-15">
        <button @click="signin" class="w-100 btn btn-lg btn-primary" type="submit">Sign in</button>
      </div>

      <p class="mt-5 mb-3 text-muted">&copy; 2017–2021</p>
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