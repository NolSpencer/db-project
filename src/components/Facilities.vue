<template>
  <div class="pet">
    <h1>{{ data.name }}</h1>
    <p>{{data.addr1}}, {{data.city}}, {{data.state}}, {{data.zip}}</p>
    <br>
    <p>Email: {{data.email}} <br> Phone Number: {{data.phone}}</p>
  </div>
</template>

<script>
export default {
  name: "Facilities",
  props: {
    data: {
      type: Object,
      required: true,
    },
  },
  data() {
    return {};
  },
};
</script>

<style lang = "scss" scoped>
.pet{
    
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
    width: 400px;
}
</style>