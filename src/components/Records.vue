<template>
  <div class="pet">
    <h1>Adoption Request: {{data.id}}</h1>
    <p>Request date: {{data.adopt_date}}</p>
    <p>Adoption fee: {{data.adopt_fee}}</p>
    <p>Account email: {{data.email}}</p>
    <p>Pet Name: {{data.petname}}</p>
  </div>
</template>

<script>
export default {
  name: "RecordsView",
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
    background-color: rgba(128,128,128,.1);
    display: inline-block;
    max-width: 700px;
    margin-left: auto;
    margin-right: auto;
    border-radius: 1.5vh;
    padding: 10px;
    width: 500px;
}
</style>