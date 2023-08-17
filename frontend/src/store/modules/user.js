export default {
    namespaced: true,
    state() {
        return{
            userId:'',
            accessToken: '',
            refreshToken: '',
            userRole: '',
            tokenType: ''
        }
    },
    getters: {
        userId(state){
            return state.userId
        },
        accessToken(state){
            return state.accessToken
        },
        userRole(state){
            return state.userRole
        },
        refreshToken(state){
            return state.refreshToken
        },
        tokenType(state){
            return state.tokenType
        }
    },
    mutations: {
        setUserId(state, newUserId){
            state.userId = newUserId
        },
        removeUserId(state){
            state.userId = ''
        },
        setAccessToken(state, newToken){
            state.accessToken = newToken
        },
        removeAccessToken(state){
            state.accessToken = ''
        },
        setUserRole(state, newRole){
            state.userRole =  newRole
        },
        removeUserRole(state){
            state.userRole = ''
        },
        setRefreshToken(state, newToken){
            state.refreshToken = newToken
        },
        removeRefreshToken(state){
            state.refreshToken = ''
        },
        setTokenType(state, newToken){
            state.tokenType = newToken
        },
        removeTokenType(state){
            state.tokenType = ''
        }
    },
    actions: {
        setUserId(store, payload){
            store.commit('setUserId', payload)
        },
        removeUserId(store, payload){
            store.commit('removeUserId', payload)
        },
        setAccessToken(store, payload){
            store.commit('setAccessToken',payload)
        },
        removeAccessToken(store,payload){
            store.commit('removeAccessToken', payload)
        },
        setUserRole(store, payload){
            store.commit('setUserRole', payload)
        },
        removeUserRole(store, payload){
            store.commit('removeUserRole', payload)
        },
        setRefreshToken(store, payload){
            store.commit('setRefreshToken', payload)
        },
        removeRefreshToken(store, payload){
            store.commit('removeRefreshToken', payload)
        },
        setTokenType(store, payload){
            store.commit('setTokenType', payload)
        },
        removeTokenType(store, payload){
            store.commit('removeTokenType', payload)
        }
    },
    strict: true,
}