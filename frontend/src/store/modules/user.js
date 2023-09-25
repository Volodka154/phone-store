export default {
    namespaced: true,
    state: () => ({
        userName: localStorage.getItem('userName'),
        accessToken: localStorage.getItem('accessToken'),
        refreshToken: localStorage.getItem('refreshToken'),
        userRole: localStorage.getItem('userRole'),
        tokenType: localStorage.getItem('tokenType')
    }),
    getters: {
        userName: state => state.userName,
        accessToken: state => state.accessToken,
        userRole: state => state.userRole,
        refreshToken: state => state.refreshToken,
        tokenType: state => state.tokenType
    },
    mutations: {
        setUserState(state, infoMass){
            localStorage.setItem('userName', infoMass[0])
            localStorage.setItem('userRole', infoMass[1])
            localStorage.setItem('tokenType', infoMass[2])
            localStorage.setItem('accessToken', infoMass[3])
            localStorage.setItem('refreshToken', infoMass[4])
            state.userName = infoMass[0]
            state.userRole = infoMass[1]
            state.tokenType = infoMass[2]
            state.accessToken = infoMass[3]
            state.refreshToken = infoMass[4]
        },
        resetUserState(state){
            state.userName = ''
            state.accessToken = ''
            state.userRole = ''
            state.refreshToken = ''
            state.tokenType = ''
            localStorage.clear()
        }
    },
    actions: {
        setUserName(store, payload){
            store.commit('setUserName', payload)
        },
        setAccessToken(store, payload){
            store.commit('setAccessToken',payload)
        },
        setUserRole(store, payload){
            store.commit('setUserRole', payload)
        },
        setRefreshToken(store, payload){
            store.commit('setRefreshToken', payload)
        },
        setTokenType(store, payload){
            store.commit('setTokenType', payload)
        },
        setUserState(store, payload){
            store.commit('setUserState', payload)
        },
        resetUserState(store, payload){
            store.commit('resetUserState', payload)
        }
    },
    strict: true,
}