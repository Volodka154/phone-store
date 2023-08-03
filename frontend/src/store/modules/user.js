export default {
    namespaced: true,
    state() {
        return{
            tokenType: '',
            accessToken:'',
            refreshToken: ''
        }
    },
    getters: {
        tokenType(state){
            return state.tokenType
        },
        accessToken(state){
            return state.accessToken
        },
        refreshToken(state){
            return state.refreshToken
        }
    },
    mutations: {
        setTokenType(state, newTokenType){
            state.tokenType = newTokenType
        },
        removeTokenType(state){
            state.tokenType = ''
        },
        setAccessToken(state, newAccessToken){
            state.accessToken = newAccessToken
        },
        removeAccessToken(state){
            state.accessToken = ''
        },
        setRefreshToken(state, newRefreshToken){
            state.refreshToken = newRefreshToken
        },
        removeRefreshToken(state){
            state.refreshToken = ''
        }
    },
    actions: {
        setTokenType(store, payload){
            store.commit('setTokenType', payload)
        },
        removeTokenType(store, payload){
            store.commit('removeTokenType', payload)
        },
        setAccessToken(store, payload){
            store.commit('setAccessToken', payload)
        },
        removeAccessToken(store, payload){
            store.commit('removeAccessToken', payload)
        },
        setRefreshToken(store, payload){
            store.commit('setRefreshToken', payload)
        },
        removeRefreshToken(store, payload){
            store.commit('removeRefreshToken', payload)
        },
    },
    strict: true,
}