export default {
    namespaced: true,
    state() {
        return{
            productsInCartList: [
                {

                }
            ]
        }
    },
    getters: {
        productsInCartList(state){
            return state.productsInCartList
        }
    },
    mutations: {
        addProductInCart(state, item, count = 1){
            state.productsInCartList.push({
                count: count, 
                item
            })
        },
        removeProductOutCart(state, item){ 
            state.productsInCartList = state.productsInCartList.filter((itemList) => {
                console.log(itemList)
                console.log(item)
                return itemList
            })
        }
    }
}