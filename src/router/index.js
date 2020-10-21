import Vue from 'vue'
import Router from 'vue-router'
import workingtimes from '@/components/workingtimes'
import workingtime from '@/components/workingtime'
import clockmanager from '@/components/clockmanager'
import chartmanager from '@/components/chartmanager'


Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '/workingTimes/:userID',
      name: 'workingtimes',
      component: workingtimes,
      props: true
    },
    {
      path: '/workingTime/:userid/:workingtimeid',
      name: 'workingtime',
      component: workingtime,
      props: true
    },
    {
      path: '/clock/:username',
      name: 'clockmanager',
      component: clockmanager,
      props: true
    },
    {
      path: '/chartManager/:userid',
      name: 'chartmanager',
      component: chartmanager,
      props: true
    }
  ]
})