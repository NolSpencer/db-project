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
      error: {
          error: null,
      }
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
      console.log(data);
    },
  },
};
</script>