<template>
  <div class="workingtimes">
    <h1>WorkingTimes</h1>
    <h3>Welcome to WorkingTimes Page</h3>
    <h3>should display an user :{{ user.data.username }}</h3>
    <h3>should display work: {{ working }}</h3>
    <h3>should display work: {{ test }}</h3>
  </div>
</template>

<script>
import axios from "axios";
export default {
  name: "workingtimes",
  props: ["userID"],
  data() {
    return {
      userId: this.userID,
      workingTimes: this.getWorkingTimes(),
      user: null,
      working: null,
      test:null,
    };
  },
  methods: {
    getWorkingTimes() {
      axios
        .get(
          "/api/workingtimes/" +
            1 +
            "?start=1997-07-16 19:20:00&end=2097-07-16 19:20:00"
        )
        .then((res) => {
          this.working = res.data;
        });
    },
  },
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
  },

};
</script>

<style scoped></style>
