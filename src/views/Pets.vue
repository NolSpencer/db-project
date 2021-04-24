<template>
  <div class="pets">
      <div v-for="pet in pets" :key="pet.id" style="margin: 10px;">
        <Pet :data="pet" ></Pet>
      </div>
  </div>
</template>

<script>
// @ is an alias to /src
import Pet from "@/components/Pet.vue";

export default {
  name: "Pets",
  components: { Pet },
  data() {
    return {
      pets: [],
    };
  },
  async mounted() {
      let data = await (await fetch('/api/pets.json')).json();
      this.pets = data;
  },
};
</script>