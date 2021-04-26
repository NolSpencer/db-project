<template>
  <div class="facilities">
      <div v-for="records in Records" :key="records.id" style="margin: 10px;">
        <RecordsView :data="records" ></RecordsView>
      </div>
  </div>
</template>

<script>
// @ is an alias to /src
import RecordsView from "@/components/Records.vue";

export default {
  name: "records",
  components: { RecordsView },
  data() {
    return {
      Records: [],
    };
  },
  async mounted() {
      let data = await (await fetch('/api/records.json')).json();
      this.Records = data;
  },
};
</script>