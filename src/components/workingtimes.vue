<template>
  <div class="workingtimes">
    <h1>WorkingTimes</h1>
    <h3>Welcome to WorkingTimes Page</h3>

    <p1>
      UserId: <br> <input v-model="userId" placeholder=""><br>
      <button v-on:click="getWorkingTimes">getWorkingTimes</button>
    </p1>
    <h1>workingTimes: {{ workingTimes }}</h1>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "workingtimes",
  props: ["userID"],
  data() {
    return {
      userId: "",
      workingTimes: "",
    };
  },
  methods: {
    getWorkingTimes() {
      axios
        .get(
          "/api/workingtimes/" +
            this.userId +
            "?start=1997-07-16 19:20:00&end=2097-07-16 19:20:00"
        )
        .then((res) => {
          this.workingTimes = res.data.data;
        });
    },
  }
  /*,
  created: function() {
    axios.get("/api/users/1").then((res) => {
      this.user = res.data;
    }),
      axios.post("/api/users/", {
        user: {
          email: "test@test.com",
          username: "test1",
        },
      });
    axios.get("/api/users?email=test12@test.com&username=test12")
    .then(res => {this.test = res.data})
  },*/
};
</script>

<style scoped></style>
