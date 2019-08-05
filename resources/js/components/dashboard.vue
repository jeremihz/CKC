<template>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="row mt-5">
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-info">
                            <div class="inner">
                                <h3>{{dash['total_users']}}</h3>

                                <p>Total Users</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-bag"></i>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-success">
                            <div class="inner">
                                <h3>{{dash['total_churches']}}</h3>

                                <p>Total Churches</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-stats-bars"></i>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-warning">
                            <div class="inner">
                                <h3>{{dash['total_pastors']}}</h3>

                                <p>Total Pastors</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-person-add"></i>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                    <div class="col-lg-3 col-6">
                        <!-- small box -->
                        <div class="small-box bg-danger">
                            <div class="inner">
                                <h3>{{dash['total_guest']}}</h3>

                                <p>Total Guests</p>
                            </div>
                            <div class="icon">
                                <i class="ion ion-pie-graph"></i>
                            </div>
                        </div>
                    </div>
                    <!-- ./col -->
                </div>
                <div class="card" v-if="$gate.isAdmin()">
                    <div class="card-header">
                        <h4>New Year Reset</h4>
                    </div>
                    <div class="card-body" style="padding: 20px;">
                        <div class="row justify-content-center">
                            <button type="button" class="btn btn-success btn-lg" @click="makeReset()">
                                <i class="fa fa-retweet"></i>
                                Reset
                            </button>
                        </div>
                    </div>
                </div>
                <div class="row justify-content-center mt-5">
                    <div class=" card col-md-8 ">
                        <fullcalender  :plugins="calendarPlugins" :events="events"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    import FullCalendar from '@fullcalendar/vue'
    import dayGridPlugin from '@fullcalendar/daygrid'
    import interactionPlugin from '@fullcalendar/interaction'
    export default {

        components: {
           'fullcalender': FullCalendar // make the <FullCalendar> tag available
        },

        data(){
            return{
                calendarPlugins: [dayGridPlugin, interactionPlugin],
                events: "",
               dash:{},
            }
        },
        methods: {

            loadUsers() {
                axios.get("api/dashboard").then(({ data }) => ([this.dash = data['data']]));
            },
            getEvents() {
                axios
                    .get("/api/calendar")
                    .then(resp => (this.events = resp.data.data))
                    .catch(err => console.log(err.response.data));
            },
            makeReset(){
                axios.put("/api/newyear").then( response => {
                    Fire.$emit('AfterCreate');
                    swal.fire({
                          type: 'success',
                          title: 'Success',
                          text: 'Reset Succesful',
                          
                        })
                });
            }

        },
        created() {
            this.loadUsers();
            this.getEvents();
        }
    }
</script>
<style lang="css">
    @import "~@fullcalendar/core/main.css";
    @import "~@fullcalendar/daygrid/main.css";

    .fc-title {
        color: #fff;
    }

    .fc-title:hover {
        cursor: pointer;
    }
</style>