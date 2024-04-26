import Vuex from 'vuex';

export default new Vuex.Store({
  state: {
    page: 'signin'
  },

  mutations: {
    setPage(state, page){
      state.page = page;
      console.log(page);
    }
  }
});