import Vuex from 'vuex';

export default new Vuex.Store({
  state: {
    page: 'signin',
    dashId: 0,
    dashName: '',
    role: 3,
    relations: [],
    technicians: []
  },

  mutations: {
    setPage(state, page){
      state.page = page;
      console.log(page);
    },
    setDashId(state, id){
      state.dashId = id;
      console.log(id);
    },
    setDashName(state, name){
      state.dashName = name;
    },
    setRole(state, role){
      state.role = role;
    },
    setRelations(state, relations){
      state.relations = relations;
    },
    setTech(state, technicians){
      state.technicians = technicians;
    }
  }
});