export default {
    namespaced: true,
    state() {
        return{
            userName: localStorage.getItem('userName'),
            accessToken: localStorage.getItem('accessToken'),
            refreshToken: localStorage.getItem('refreshToken'),
            userRole: localStorage.getItem('userRole'),
            tokenType: localStorage.getItem('tokenType')
        }
    },
    getters: {
        userName(state){
            return state.userName
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
        setUserName(state, newUserName){
            state.userName = newUserName
        },
        removeUserName(state){
            state.userName = ''
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
        setUserName(store, payload){
            store.commit('setUserName', payload)
        },
        removeUserName(store, payload){
            store.commit('removeUserName', payload)
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