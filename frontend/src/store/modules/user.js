export default {
    namespaced: true,
    state() {
        return{
            userId:'11',
            refreshToken: ''
        }
    },
    getters: {
        userId(state){
            return state.userId
        },
        refreshToken(state){
            return state.refreshToken
        }
    },
    mutations: {
        setUserId(state, newUserId){
            state.userId = newUserId
        },
        removeUserId(state){
            state.userId = ''
        },
        setRefreshToken(state, newToken){
            state.refreshToken = newToken
        },
        removeRefreshToken(state){
            state.refreshToken = ''
        }
    },
    actions: {
        setUserId(store, payload){
            store.commit('setUserId', payload)
        },
        removeUserId(store, payload){
            store.commit('removeUserId', payload)
        },
        setRefreshToken(store, payload){
            store.commit('setRefreshToken',payload)
        },
        removeRefreshToken(store,payload){
            store.commit('removeRefreshToken', payload)
        }
    },
    strict: true,
}