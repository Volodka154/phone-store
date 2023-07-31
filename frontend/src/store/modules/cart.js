export default {
    namespaced: true,
    state() {
        return{
            totalPrice: 0,
            productsInCartList: [
                
            ],
            countProduct: 0
        }
    },
    getters: {
        productsInCartList(state){
            return state.productsInCartList
        },
        totalPrice(state){
            return state.totalPrice
        },
        countProduct(state){
            return state.countProduct
        }

    },
    mutations: {
        
        addProductInCart(state, item){
         /*   if (state.productsInCartList.length !=0){
                if (state.productsInCartList.find(product => product.id === 2)==undefined){ */
                    state.productsInCartList.push(
                        item
                    )
             /*   }
                else {
                    let reccuringItem = state.productsInCartList.find(product => product.id === 2)


                }
            } */

            
        },
        removeProductOutCart(state, newId){  
            let productPrice = state.productsInCartList.find(product => product.id === newId).price
            let index = state.productsInCartList.filter((item) => item.id !== newId);
            state.productsInCartList = index
            state.countProduct -=1
            state.totalPrice -=productPrice

        },
        changeTotalPrice(state,item){
            state.totalPrice += item
        },
        changeCountProduct(state, item){
            state.countProduct += item
        }
    },
    actions: {
        addProductInCart(store, payload){
            store.commit('addProductInCart', payload)
        },
        removeProductOutCart(store, payload){
            store.commit('removeProductOutCart', payload)
        },
        changeTotalPrice(store,payload){
            store.commit('changeTotalPrice',payload)
        },
        changeCountProduct(store,payload){
            store.commit('changeCountProduct', payload)
        }
    }
}