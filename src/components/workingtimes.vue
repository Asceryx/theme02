<template>
  <div class="workingtimes">
    <h1>WorkingTimes</h1>
    <h3>Welcome to WorkingTimes Page</h3>
  </div>
</template>

<script>
export default {
  name: 'workingtimes',
  props: ['userID'],
  data() {
    return {
      userId : this.userID,
      workingTimes : this.getWorkingTimes()
    }
  },
  methods: {
      getWorkingTimes() {}
  },
}
</script>

<style scoped></style>