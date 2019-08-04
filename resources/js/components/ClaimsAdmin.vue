<template>
    <div class="container-fluid">
        <div class="row mt-5" v-if="$gate.isAdmin()">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Claims Admin</h3>

                        <div class="card-tools">

                        </div>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body p-0">
                        <div class="row" style="padding: 20px;">
                            <div class="col-md-3" v-for="claim in claims" :key="claim.id">
                                <!-- Widget: user widget style 2 -->
                                <div class="card card-widget widget-user-2">
                                    <!-- Add the bg color to the header using any of the bg-* classes -->
                                    <div class="widget-user-header bg-primary">
                                        <!-- /.widget-user-image -->
                                        <h3 class="widget-user-username">{{ claim.ministry_id }}</h3>
                                        <h5 class="widget-user-desc">Nairobi</h5>
                                    </div>
                                    <div class="card-footer p-0">
                                        <ul class="nav flex-column">
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    Total Amount <span class="float-right badge bg-primary">{{ claim.total_claim}}</span>
                                                </a>
                                            </li>
                                            <li class="nav-item">
                                                <a href="#" class="nav-link">
                                                    No. Pastors <span class="float-right badge bg-info">5</span>
                                                </a>
                                            </li>
                                            <li class="nav-item" style="padding: 5px;">
                                                <router-link :to="{path:'/claim_details/'+ claim.ministry_id}">
                                                    <button type="button" class="btn btn-block btn-primary">
                                                        Details
                                                    </button>
                                                </router-link>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <!-- /.widget-user -->
                            </div>
                        </div>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "ClaimsAdmin",
        data() {
            return {
                claims: {}
            }
        },
        methods: {
            loadClaims() {
                axios.get("api/claims-admin").then(({data}) => (this.claims = data));
            },
        },
        created() {
            this.loadClaims();
        }
    }
</script>

<style scoped>

</style>