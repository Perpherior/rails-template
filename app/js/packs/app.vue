<template>
  <MainLayout>
    <router-view></router-view>
  </MainLayout>
</template>

<script>
  import MainLayout from './layouts/main'
  import Vue from 'vue'
  import VueRouter from 'vue-router'
  import VueResource from 'vue-resource'

  Vue.use(VueRouter)
  Vue.use(VueResource)

  const routes = [
//    { path: '/', component: Dashboard }
  ]

  const router =  new VueRouter({
    routes,
    mode: 'history',
    linkActiveClass: "active"
  })

//  Vue.http.options.root = '/api';

  Vue.http.interceptors.push(function(request, next) {
    if(request.method != 'GET') {
      request.headers.set('X-CSRF-Token', $('[name="csrf-token"]').attr('content'));
    }

    // continue to next interceptor
    next();
  });

  export default {
    router,
    components: {
      MainLayout
    }
  }
</script>
