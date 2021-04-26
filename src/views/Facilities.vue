<template>
  <div class="facilities">
      <div v-for="location in facilities" :key="location.id" style="margin: 10px;">
        <Facilities :data="location" ></Facilities>
      </div>
  </div>
</template>

<script>
// @ is an alias to /src
import Facilities from "@/components/Facilities.vue";

export default {
  name: "Facility",
  components: { Facilities },
  data() {
    return {
      facilities: [],
    };
  },
  async mounted() {
      let data = await (await fetch('/api/facilities.json')).json();
      this.facilities = data;
  },
};
</script>