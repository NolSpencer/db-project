<template>
  <div class="hello">
    <h1>{{ msg }}</h1>
    <p1>
      Don't Shop! Adopt!
    </p1>
    <h3> **DISCLAIMER** </h3>
    <p> **ALL DATA WAS TAKEN FROM ONE OF A KIND PETS** </p>
    <p> **PLEASE VISIT THEIR WEBSITE IF YOU WANT TO ADOPT** </p>
  </div>
</template>

<script>
export default {
  name: 'HelloWorld',
  props: {
    msg: String
  }
}
</script>

<!-- Add "scoped" attribute to limit CSS to this component only -->
<style scoped lang="scss">
p1{ 
  font-size: 30px;
}
h3 {
  margin: 30px 0 0;
}
ul {
  list-style-type: none;
  padding: 0;
}
li {
  display: inline-block;
  margin: 0 10px;
}
a {
  color: #42b983;
}
</style>
