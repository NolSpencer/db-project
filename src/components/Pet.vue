<template>
  <div class="pet">
    <h1>{{ data.name }} - {{data.age}}</h1>
    <span class="petdata">
        <img :src="'/api/pet/' + data.id + '/image'" style="grid-area:image"/>
        <p style="grid-area:description">{{data.description}}</p>
        <button @click="adopt">Adopt</button>
    </span>
    <br>
    {{ data }}
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
        await fetch("/session", {
          method: "GET",
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

<style lang = "scss" scoped>
.pet{
    img{
        width: 200px;
        height: auto;
        padding: 10px;
        border-radius: 1.5vh;
    }
    .petdata{
        display:grid;
        grid-template-areas: "image description";
        
    }
    background-color: rgba(128,128,128,.1);
    display: inline-block;
    max-width: 700px;
    margin-left: auto;
    margin-right: auto;
    border-radius: 1.5vh;
    padding: 10px;
}
</style>