<template>
    <div class="container-fluid">
        <div class="row mt-5">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Church Contributions</h3>
                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Date</th>
                                <th>Amount</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="contr in churchCont" :key="contr.id">
                                <td>{{ contr.created_at | myDate}}</td>
                                <td>Ksh. {{ contr.amount }}</td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <!-- /.card -->
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "ClaimDetails",
        data() {
            return {
                churchCont: {},
                id: this.$route.params.churchId,
            }
        },
        methods: {
            loadDetails() {
                axios.get("/api/churchdetails/" + this.id).then(response => {this.churchCont = response.data['contributions']})
                    .catch(error => {console.error(error)});
            }
        },
        created() {
            this.loadDetails();
        }
    }
</script>

<style scoped>

</style>