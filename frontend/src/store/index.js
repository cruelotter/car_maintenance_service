import Vuex from 'vuex';

export default new Vuex.Store({
  state: {
    page: 'signin',
    dashId: 0
  },

  mutations: {
    setPage(state, page){
      state.page = page;
      console.log(page);
    },
    setDashId(state, id){
      state.dashId = id;
      console.log(id);
    }
  }
});