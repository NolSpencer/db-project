<template>
  <div class="login">
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