export default {
    namespaced: true,
    state() {
        return{
            allCategoryList: ['1','2'],
            nameOfCategory: localStorage.getItem('nameOfCategory'),             // название выбранной категории для просмотра и обновления компонента с каталогом 
            nameOfSubcategory: localStorage.getItem('nameOfSubcategory'),             // название выбранной категории для просмотра и обновления компонента с каталогом 
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
        allCategoryList(state){
            return state.allCategoryList
        },
        nameOfCategory(state){
            return state.nameOfCategory
        },
        nameOfSubcategory(state){
            return state.nameOfSubcategory
        },
        isModalCategoryList(state){
            return state.isModalCategoryList
        },
        pathInNavBarMass(state){
            return state.pathInNavBarMass
        }
    },
    mutations: {
        setAllCategoryList(state, payload){
            state.allCategoryList = payload
        },
        setNameByCategory(state, newNameByCategory){
            state.nameOfCategory = newNameByCategory
        },
        setNameBySubcategory(state, newNameBySubcategory){
            state.nameOfSubcategory = newNameBySubcategory
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
        setAllCategoryList(store, payload){
            store.commit('setAllCategoryList', payload)
        },
        setNameByCategory(store, payload){
            store.commit('setNameByCategory', payload)
        },
        setNameBySubcategory(store, payload){
            store.commit('setNameBySubcategory', payload)
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