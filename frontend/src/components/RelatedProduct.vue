<template>
    <div id="related-product">
        <h5 class="title">чехол для Iphone 12</h5>
        <img src="https://c.dns-shop.ru/thumb/st4/fit/500/500/9c060b3cb478ddb0fb6ed8807b7f7066/5e73e844939e1ad8fa591a74bcd742506d9a2b22d428eb546fcfc85679e76e39.jpg.webp" 
                 class="imgRelatedProductClass">
    </div>
  </template>
  
  <script>
export default {
    name: 'related-product',
    props: {},
    data() {
        return {
        };
    },
    computed: {

    },
    mounted(){

    }
}
  </script>
    
  <style>
    .related-product {
        display: flex;
        flex-direction: column;
        align-items: stretch;
    }
    .imgRelatedProductClass{
        align-self: center;
        width: 10%;
        height: 10%;
        cursor: pointer;
    }
    .title{
        color: #33b75c;
    }
    .title:hover {
        color: #185b2d;
        cursor: pointer;
    }   
    
  </style>