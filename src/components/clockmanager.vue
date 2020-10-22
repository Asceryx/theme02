<template>
  <div class="clockmanager">
    <h1>ClockManager</h1>
    <h3>Welcome to ClockManager Page</h3>
  </div>
</template>

<script>
export default {
  name: 'clockmanager',
  props: ['username'],
  data() {
    return {
      startDateTime: null,
      clockIn : false
    }
  },
  methods: {
      refresh() {},
      clock() {},
  }

}
</script>

<style scoped></style>