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
                            <div class="col-lg-3 col-6" v-for="claim in claims" :key="claim.id">
                                <!-- small card -->
                                <div class="small-box bg-success">
                                  <div class="inner">
                                    <h3>Ksh {{ claim.total_claim}}</h3>

                                    <h5>{{ claim.church_name }}</h5>
                                    <small>{{ claim.church_location }}</small>
                                  </div>
                                  <div class="icon">
                                    <i class="fas fa-church"></i>
                                  </div>
                                  <router-link :to="{path:'/claim_details/'+ claim.ministry_id}" class="small-box-footer" style="font-size:20px;">
                                    More info <i class="fas fa-arrow-circle-right"></i>
                                  </router-link>
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