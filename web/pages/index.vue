<template>
  <div class="container">
    <div>
      <h1 class="title">web</h1>

      <button @click="loadDummyData">データを読み込む</button>

      <template v-if="loading">
        <p>データを読み込んでいます。しばらくお待ちください。</p>
      </template>
      <template v-else>
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
      </template>
    </div>
  </div>
</template>

<script>
export default {
  data() {
    return {
      dummyData: {},
      loading: false,
    }
  },
  methods: {
    async loadDummyData() {
      try {
        this.loading = true

        const resp = await this.$axios.$get('/dummy')
        console.log(resp)
        this.dummyData = resp.data
      } catch (e) {
        console.error(e)
      } finally {
        this.loading = false
      }
    },
  },
}
</script>

<style></style>
