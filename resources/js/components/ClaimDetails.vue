<template>
    <div class="container-fluid">
        <div class="row mt-5">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Claim</h3>
                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Title</th>
                                <th>Date</th>
                                <th>Event</th>
                                <th>From</th>
                                <th>To</th>
                                <th>Amount</th>
                                <th>Journey</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="claim in claimList.data" :key="claim.id">
                                <td>{{ claim.title }}</td>
                                <td>{{ claim.created_at | myDate }}</td>
                                <td>{{ claim.event }}</td>
                                <td>{{ claim.from_start }}</td>
                                <td>{{ claim.to_destination }}</td>
                                <td><span class="tag tag-success">{{ claim.amount }}</span></td>
                                <td>{{ claim.journey }}</td>
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
                claimList: [],
                id: this.$route.params.ministryId,
            }
        },
        methods: {
            loadDetails() {
                axios.get("/api/claimdetails/" + this.id).then(response => {this.claimList = response.data})
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