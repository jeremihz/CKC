
<template>
    <div class="container">
        <div class="row">
            <div class="col-md-4 mt-5" v-for="chur in church.data" :key="chur.id">
                <div class="card card-primary card-outline">
                    <div class="card-body box-profile">
                        <h3 class="profile-username text-center"><b>{{chur.name}}</b></h3>
                        <p class="text-muted text-center">{{chur.location}}</p>

                        <ul class="list-group list-group-unbordered mb-3">
                            <li class="list-group-item">
                                <b> Members Monthly statistical</b> <a class="float-right"></a>
                            </li>


                        </ul>

                        <router-link :to="{path:'/church_details/'+ chur.id}">
                            <button type="button" class="btn btn-block btn-primary" style="margin-bottom: 5px;">
                                Details
                            </button>
                        </router-link>

                    </div>
                    <!-- /.card-body -->
                </div>
            </div>
        </div>
        <div class="card-footer">
            <pagination :data="church" @pagination-change-page="getResults"></pagination>
        </div>
    </div>

</template>

<script>
    export default {
        name: "pastors",
        data() {
            return {
                church: {},
                form: new Form({
                    id:'',
                    name:'',
                    location: '',
                })

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
                axios.get("api/church").then(({data}) => (this.church = data));
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
