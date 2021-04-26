<template>
  <div class="login">
    <h1>LOGIN</h1>
    <input type="email" placeholder="Email" v-model="info.email" />
    <br>
    <input type="password" placeholder="Password" v-model="info.password" />
    <br>
    <button @click="login">Login</button>
  </div>
</template>

<script>
export default {
  name: "Login",
  data() {
    return {
      info: {
            email: "",
            password: "",
      },
      
    };
  },
  methods: {
    async login() {
      let data = await (
        await fetch("/api/login", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(this.info)
        })
      ).text();
      if(data == "true"){this.$router.push({ path: `/pets` })}
      //console.log(data);
    },
  },
};
</script>

<style scoped>
input{
  width:200px;
  padding: 10px;
  margin: 5px;
  border-radius: 5px;
}
h1{
  margin-top:5px;
}
button{
  width: 100px;
  padding: 10px;
  font-size: 20px;
  border-radius: 7px;
}
</style>