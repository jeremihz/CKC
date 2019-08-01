
<template>
    <div class="container">
        <div class="row">
            <div class="col-md-4 mt-5" v-for="chur in church" :key="chur.id">
                <div class="card card-primary card-outline">
                    <div class="card-body box-profile">
                        <h3 class="profile-username text-center"><b>{{chur.church_name}}</b></h3>
                        <p class="text-muted text-center">{{chur.location}}</p>

                        <ul class="list-group list-group-unbordered mb-3">
                            <li class="list-group-item">
                                <b>Total members</b> <a class="float-right">{{chur.total_members}}</a>
                            </li>
                            <li class="list-group-item">
                                <b>New Members</b> <a class="float-right">{{chur.new_members}}</a>
                            </li>
                            <li class="list-group-item">
                                <b>Deregestered Members</b> <a class="float-right">{{chur.dropped_members}}</a>
                            </li>

                        </ul>

                    </div>
                    <!-- /.card-body -->
                </div>

            </div>
        </div>
        <div class="card-footer">
            <pagination :data="users" @pagination-change-page="getResults"></pagination>
        </div>
    </div>

</template>

<script>
    export default {
        name: "pastors",
        data() {
            return {
                church: {},


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
                axios.get("api/church").then(({data}) => (this.church = data['members']));
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
