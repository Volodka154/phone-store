export default {
    namespaced: true,
    state: () => ({
        countCart: 0,
        productsInCartList: [{}]
    }),
    getters: {
        productsInCartList: state => state.productsInCartList,
        countCart: state => state.countCart
    },
    mutations: {
        addCart(state, amount){
            state.countCart += amount
        },
        removeCart(state, amount){
            state.countCart -= amount
        }, 
        nullCart(state){
            state.countCart = 0
        }
    },
    actions: {
        addCart(store, payload){
            store.commit('addCart', payload)
        },
        removeCart(store, payload){
            store.commit('removeCart', payload)
        },
        nullCart(store, payload){
            store.commit('nullCart', payload)
        }
    },
    strict: true,
}