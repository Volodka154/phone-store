export default {
    namespaced: true,
    state() {
        return{
            countCart: 0,
            productsInCartList: [
                {

                }
            ]
        }
    },
    getters: {
        productsInCartList(state){
            return state.productsInCartList
        },
        countCart(state){
            return state.countCart
        }
    },
    mutations: {
        addProductInCart(state, item, count = 1){
            state.productsInCartList.push({
                count: count, 
                item
            })
        },
        addCart(state, amount){
            state.countCart += amount
        },
        removeProductOutCart(state, item){ 
            state.productsInCartList = state.productsInCartList.filter((itemList) => {
                console.log(itemList)
                console.log(item)
                return itemList
            })
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