<template>
    <div class="container-fluid">
        <div class="row mt-5" v-if="$gate.isAdmin()">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Claims</h3>
                        <div class="card-tools">
                            <router-link to="/claims-admin" class="btn btn-primary">
                                <i class="fa fa-arrow-left"></i>
                                Back
                            </router-link>
                        </div>
                    </div>
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Guest</th>
                                <th>Title</th>
                                <th>Date</th>
                                <th>Event</th>
                                <th>From</th>
                                <th>To</th>
                                <th>Journey</th>
                                <th>Amount</th>
                                
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="claim in claimList" :key="claim.id">
                                <td>{{ claim.user_name }}</td>
                                <td>{{ claim.title }}</td>
                                <td>{{ claim.created_at | myDate }}</td>
                                <td>{{ claim.event_name }}</td>
                                <td>{{ claim.from_start }}</td>
                                <td>{{ claim.to_destination }}</td>
                                <td>{{ claim.journey }}</td>
                                <td><span class="tag tag-success">Ksh. {{ claim.amount }}</span></td>
                                
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
                claimList: {},
                id: this.$route.params.ministryId,
            }
        },
        methods: {
            loadDetails() {
                axios.get("/api/claimdetails/" + this.id).then(({data}) => (this.claimList = data['claimings']))
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