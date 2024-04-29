<script setup>
//import { ref, onMounted } from 'vue';
import SignIn from './pages/SignIn';
import MainPage from './pages/MainPage';
import DashBoard from './pages/DashBoard';
import OrderCustomer from './pages/OrderCustomer';
import DashComponent from './pages/DashComponent';
import UserRelations from './pages/UserRelations';
import RegisterUser from './pages/RegisterUser';


import store from '@/store/index';
  
</script>
<template>
    <SignIn v-if="store.state.page === 'signin'" />
    <MainPage v-if="store.state.page === 'main'" />
    <DashBoard v-if="store.state.page === 'dashboard'" />
    <OrderCustomer v-if="store.state.page === 'orders'" />
    <DashComponent v-if="store.state.page === 'dashboard-component'" />
    <UserRelations v-if="store.state.page === 'relations'" />
    <RegisterUser v-if="store.state.page === 'register'" :relations="relations.value" />

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
