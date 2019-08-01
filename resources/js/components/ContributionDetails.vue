<template>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">Contributions</div>

                    <div class="card-body">
                        <div class="row">
                            <div class="col-sm-4" v-for="detail in details" :key="detail.id">
                                <div class="card">
                            <div class="card-body">
                                <h4 class="card-title">{{detail.church_name}}</h4>
                                <span>Target</span> : <span>{{detail.church_target}}</span><br>
                                <span>Contributed</span> : <span>{{detail.total_contributed}}</span><br>
                                <span>Percentage</span> : <span>{{detail.percentage}}%</span><br>
                                <router-link :to="{path:'/church-contributions/' + detail.church_id}" class="btn btn-primary" style="margin-bottom: 10px;">
                                    View Detail
                                </router-link>
                            </div>
                        </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                details:{}
            }
        },
        methods: {
            loadDetails(){
                axios.get("api/contrDetails").then(({ data }) => ([this.details = data['unique_arr']]));
            }
        },
        created() {
            this.loadDetails();
        }
    }
</script>
