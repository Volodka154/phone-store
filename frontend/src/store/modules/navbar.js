export default {
    namespaced: true,
    state() {
        return{
            indexInCategory: 0,             // индекс выбранной категории для просмотра и обновления компонента с каталогом 
            isModalCategoryList: false,     // модальное окно категорий при клике на "Каталог" в хедере
            pathInNavBarMass: [
                {
                    title: 'Главная',
                    path: '/catalog'
                }
            ],
            
        }
    },
    getters: {
        indexInCategory(state){
            return state.indexInCategory
        },
        isModalCategoryList(state){
            return state.isModalCategoryList
        },
        pathInNavBarMass(state){
            return state.pathInNavBarMass
        }
    },
    mutations: {
        setIndexByCategory(state, newIndexByCategory){
            state.indexInCategory = newIndexByCategory
        },
        changeIsModalCategoryList(state){
            state.isModalCategoryList = ! state.isModalCategoryList
        },
        addPatInNavBarMass(state, payload){
            state.pathInNavBarMass.push(payload)
        },
        removePatInNavBarMass(state, indexFromDelete){
            state.pathInNavBarMass.splice(indexFromDelete)
        }
    },
    actions: {
        setIndexByCategory(store, payload){
            store.commit('setIndexByCategory', payload)
        },
        changeIsModalCategoryList(store){
            store.commit('changeIsModalCategoryList')
        },
        addPatInNavBarMass(store, payload){
            store.commit('addPatInNavBarMass', payload)
        },
        removePatInNavBarMass(store, payload){
            store.commit('removePatInNavBarMass', payload)
        }
    },
    strict: true,
}