<template>
  <div class="workingtime">
    <h1>WorkingTime</h1>
    <h3>Welcome to WorkingTime Page</h3>
    <p1>
      start: <br />
      <input v-model="start" placeholder="" /><br />
      end: <br />
      <input v-model="end" placeholder="" /><br /><br />
      UserId: <br />
      <input v-model="userId" placeholder="" /><br />
      <button v-on:click="createWorkingTime">createWorkingTime</button><br />
      WorkingTimeId: <br />
      <input v-model="WorkingTimeId" placeholder="" /><br />
      <button v-on:click="updateWorkingTime">updateWorkingTime</button>
      <button v-on:click="deleteWorkingTime">deleteWorkingTime</button><br />
    </p1>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "workingtime",
  props: ["userid", "workingtimeid"],
  data: function () {
    return {
      end: "",
      start: "",
      userId: "",
      WorkingTimeId: "",
    };
  },
  methods: {
    createWorkingTime() {
      axios.post("/api/workingtimes/" + this.userId, {
        working_time: {
          end: this.end,
          start: this.start,
        },
      });
    },
    updateWorkingTime() {
      axios.put("/api/workingtimes/" + this.WorkingTimeId, {
        working_time: {
          end: this.end,
          start: this.start,
        },
      });
    },
    deleteWorkingTime() {
      axios.delete("/api/workingtimes/" + this.WorkingTimeId);
    },
  },
};
</script>

<style scoped></style>
