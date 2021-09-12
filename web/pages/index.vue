<template>
  <div class="container">
    <div>
      <h1 class="title">web</h1>

      <button @click="loadDummyData">データを読み込む</button>

      <template v-if="dummyData.length > 0">
        <table>
          <thead>
            <tr>
              <th>ID</th>
              <th>NAME</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="r in dummyData" :key="r.id">
              <td>{{ r.id }}</td>
              <td>{{ r.name }}</td>
            </tr>
          </tbody>
        </table>
      </template>
      <template v-else>
        <p>データを読み込んでください。</p>
      </template>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dummyData: {},
    }
  },
  methods: {
    async loadDummyData() {
      const resp = await this.$axios.$get('/dummy')
      console.log(resp)
      this.dummyData = resp.data
    },
  },
}
</script>

<style></style>
