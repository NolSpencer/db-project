<template>
  <div class="delete">
      <h1>Delete Account</h1>
    <input type="email" placeholder="Email" v-model="info.email" />
    <br>
    <input type="password" placeholder="Password" v-model="info.password" />
    <br>
    <button @click="deleteaccount">Delete</button>
  </div>
</template>

<script>
export default {
  name: "Deleteaccount",
  data() {
    return {
      info: {
            email: "",
            password: "",
      },
      
    };
  },
  methods: {
    async deleteaccount() {
      let data = await (
        await fetch("/api/deleteaccount", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(this.info)
        })
      ).text();
      console.log('ACCOUNT DELETED!');
    },
  },
};
</script>

<style scoped>
input{
  width:200px;
  padding: 10px;
  margin: 5px;
}
h1{
  margin:-1px;
}
button{
  width: 100px;
  padding: 10px;
  font-size: 20px;
}
</style>