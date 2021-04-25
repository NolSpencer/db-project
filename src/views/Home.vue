<template>
  <div class="home">
    <img  src="../../pictures/dog_1.jpg">
    <HelloWorld msg="Totally Real Pet Adoption"/>
  </div>
</template>

<script>
// @ is an alias to /src
import HelloWorld from '@/components/HelloWorld.vue'

export default {
  name: 'Home',
  components: {
    HelloWorld
  }
}
</script>
