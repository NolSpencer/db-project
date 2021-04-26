<template>
  <div class="pet">
    <h1>{{ data.petname }} - {{data.breedname}}</h1>
    <span class="petdata">
      <p>
        <img :src="'/api/pet/' + data.id + '/image'" />{{data.petdescription}}
        <br>
        <ul>
          <li>Sex: {{data.sex}}</li>
          <li>Age: {{data.age}}</li>
          <li>Weight: {{data.weight}}</li>
        </ul>
        <ul>
          <li>Size: {{data.size}}</li>
          <li>Fixed: {{data.sp_neu}}</li>
          <li>Price: $250</li>
        </ul>
      </p>
    </span>
    <br><br><br>
    <h2>{{data.facilityname}}</h2>
    <button @click="adopt">Adopt</button>
  </div>
</template>

<script>
export default {
  name: "Pet",
  props: {
    data: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {};
  },
  methods: {
    async adopt() {
      let data = await (
        await fetch("/api/adoptionrecords", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify(this.data)
        })
      ).text();
      console.log(data);
    },
  },
};
</script>

<style lang = "scss" scoped>
.pet{
  img{
    width: 200px;
    height: auto;
    padding: 10px;
    border-radius: 1.5vh;
    float:left;
  }
  button{
    padding: 30px;
    width: 200px;
    text-align: center;
    font-size:30px;
    border-radius: 10px;
    background-color:#42b983;
    opacity: .9;
  }
  ul{
    display: inline-block;
    text-align: left;
    margin: 35px;
  }
  font-size: 20px;
  background-color: rgba(128,128,128,.1);
  display: inline-block;
  max-width: 750px;
  margin-left: auto;
  margin-right: auto;
  border-radius: 1.5vh;
  padding: 10px;
}
</style>