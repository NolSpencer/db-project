<template>
  <div class="signup">
    <h1>Signup</h1>
    <input type="firstname" placeholder="Firstname" v-model="info.firstname" />
    <input type="lastname" placeholder="Lastname" v-model="info.lastname" />
    <br />
    <input type="email" placeholder="Email" v-model="info.email" />
    <input type="password" placeholder="Password" v-model="info.password" />
    <br />
    <input type="addr1" placeholder="addr1" v-model="info.addr1" />
    <input type="addr2" placeholder="addr2" v-model="info.addr2" />
    <br />
    <input type="city" placeholder="City" v-model="info.city" />
    <input type="state" placeholder="State" v-model="info.state" />
    <br />
    <input type="zip" placeholder="Zip code" v-model="info.zip" />
    <br>
    <button @click="signup">Signup</button>
  </div>
</template>

<script>
export default {
  name: "Signup",
  data() {
    return {
      info: {
            firstname: "",
            lastname: "",
            phone_no: "",
            email: "",
            addr1: "",
            addr2: "",
            city: "",
            state: "",
            zip: "",
            password: "",
      },
      error: {
          error: null,
      }
    };
  },
  methods: {
    async signup() {
      let data = await (
        await fetch("/api/signup", {
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

<style scoped>
input{
  width: 200px;
  padding:10px;
  margin: 4px;
}
button{
  font-size: 18px;
  width: 100px;
  padding:10px;
}
</style>
