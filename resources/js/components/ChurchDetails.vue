
<template>
    <div class="container">
        <router-link to="/church" class="fas fa-arrow-circle-left">
            <i class="fa fa-arrow-left"></i>
            Back
        </router-link>
        <div class="row mt-5" v-if="$gate.isAdmin()">

            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Monthly Statistical Data</h3>

                    </div>
                    <div v-if="!$gate.isAdmin()">
                        <not-found></not-found>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tbody><tr>
                                <th>Total members</th>
                                <th>New Members</th>
                                <th>Deregestered Members</th>
                                <th>Updated on</th>


                            </tr>
                            <tr v-for="chur in church.data" :key="chur.id">
                                <td>{{chur.total_members}}</td>
                                <td>{{chur.new_members}}</td>
                                <td>{{chur.dropped_members}}</td>
                                <td>{{chur.created_at | myDate}}</td>
                                <td></td>

                            </tr>



                            </tbody></table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
    </div>

</template>

<script>
    export default {
        name: "ChurchDetails",
        data() {
            return {
                church: {},
                id: this.$route.params.ministryId

            }
        },
        methods: {
            getResults(page = 1) {
                axios.get('api/church?page=' + page)
                    .then(response => {
                        this.church = response.data;
                    });
            },
            loadUsers() {
                axios.get("/api/churchDetails/" + this.id).then(response => {this.church = response.data});
            },

        },

        created() {
            Fire.$on('searching', ()=>{
                let query = this.$parent.search;
                axios.get('api/findChurch?q=' + query)
                    .then((data)=>{
                        this.church = data.data;
                    })
                    .catch(()=>{

                    })
            })
            this.loadUsers();

        }
    }
</script>
