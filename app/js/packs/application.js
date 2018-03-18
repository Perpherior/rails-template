require('jquery-ujs')

import 'bootstrap/dist/css/bootstrap'
import 'bootstrap/dist/js/bootstrap'

import App from './app'
import Vue from 'vue'

$(() => {
  const app = new Vue(App).$mount('#app')
})
