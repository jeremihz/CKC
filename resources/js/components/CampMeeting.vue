<template>
    <div class="container-fluid">
        <div class="row mt-5">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Camp Meeting</h3>

                        <div class="card-tools">
                            <button v-if="$gate.isAdmin()" type="button" class="btn btn-danger" @click="reset()">
                                <i class="fa fa-retweet"></i>
                                Reset
                            </button>
                            <button v-if="$gate.isAdmin()" type="button" class="btn btn-primary" @click="newModal">
                                <i class="fa fa-pen"></i>
                                Compose
                            </button>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-lg-3 col-6" v-for="weeky in weeks" :key="weeky.id">
                                    <!-- small box -->
                                    <div class="small-box bg-info">
                                      <div class="inner">
                                        <h3>{{ weeky.week_number }}</h3>

                                        <p>Week</p>
                                      </div>
                                      <div class="icon">
                                        <i class="ion ion-bag"></i>
                                      </div>
                                      <router-link :to="{path:'/weekdetails/'+ weeky.week_number}" class="small-box-footer" style="font-size: 20px;">More info <i class="fa fa-arrow-circle-right"></i></router-link>
                                    </div>
                                  </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.card-header -->
                    
                    <!-- /.card-body -->
                    <!-- div class="card-footer">
                        <pagination :data="messages" @pagination-change-page="getResults">
                            <span slot="prev-nav">&lt; Previous</span>
                            <span slot="next-nav">Next &gt;</span>
                        </pagination>
                    </div> -->
                </div>
                <!-- /.card -->
            </div>
        </div>
        <div class="modal fade" id="CommunicationModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editMode" class="modal-title">Create</h5>
                        <h5 v-show="editMode" class="modal-title">Edit Message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="makeGeneration()">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="event">Event</label>
                                <select v-model="form.event" class="form-control" name="event" id="event"
                                        :class="{ 'is-invalid': form.errors.has('event') }" @change="getEventWeeks()">
                                    <option selected value="">--Select Event--</option>
                                    <option v-for="act in Active" :key="act.id" :value="act.id">{{ act.event_name}}</option>
                                </select>
                                <has-error :form="form" field="event"></has-error>
                            </div>
                            <div class="form-group">
                                <label for="week">Week</label>
                                <select v-model="form.week" class="form-control" name="week" id="week"
                                        :class="{ 'is-invalid': form.errors.has('week') }">
                                    <option selected value="">--Select Week--</option>
                                    <option v-for="we in eventWeeks" :key="we['week']" :value="we['week']">{{ we.week_name}}</option>
                                </select>
                                <has-error :form="form" field="week"></has-error>
                            </div>
                            <div class="form-group">
                                <label for="church">Church</label>
                                <select v-model="form.church" class="form-control" name="church" id="church"
                                        :class="{ 'is-invalid': form.errors.has('church') }">
                                    <option selected value="">--Select Church--</option>
                                    <option v-for="church in churches" :key="church.id" :value="church.id">{{ church.name}}</option>
                                </select>
                                <has-error :form="form" field="church"></has-error>
                            </div>
                            <div class="form-group">
                                <label for="no_guests">No. of Guests</label>
                                <input v-model="form.no_guests" type="number" class="form-control" name="no_guests" id="no_guests"
                                       placeholder="No. of Guests" :class="{ 'is-invalid': form.errors.has('no_guests') }">
                                <has-error :form="form" field="no_guests"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="!editMode" type="submit" class="btn btn-success">
                                <i class="fa fa-send"></i>
                                Post
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "CampMeeting",
        data() {
            return {
                editMode: false,
                churches: {},
                Active: {},
                weeks: {},
                eventWeeks: {},
                campDetails: {},
                form: new Form({
                    id: '',
                    week: '',
                    church: '',
                    no_guests: '',
                    event: ''
                })
            }
        },
        methods: {
            newModal() {
                this.editMode = false;
                this.form.reset();
                $('#CommunicationModal').modal('show');
            },
            editModal(mes) {
                this.editMode = true;
                this.form.reset();
                $('#CommunicationModal').modal('show');
                this.form.fill(mes);
            },
            loadChurches() {
                axios.get("api/ministries").then(({ data }) => ([this.churches = data['ministries']]));
            },
            loadWeeks() {
                axios.get("api/getWeekNumber").then(({ data }) => ([this.weeks = data['weekly']]));
            },
            getChurches() {
                axios.get("api/getChurches").then(({ data }) => ([this.churches = data['churches']]));
                
            },
            reset() {
                axios.put("/api/reset").then( response => {
                    Fire.$emit('AfterCreate');
                    swal.fire({
                          type: 'success',
                          title: 'Success',
                          text: 'Reset Succesful',
                          
                        })
                });
                
            },
            makeGeneration() {
                this.$Progress.start();
                this.form.post('api/createmeeting')
                    .then(() => {
                        Fire.$emit('AfterCreate');
                        $('#CommunicationModal').modal('hide');
                        toast.fire({
                            type: 'success',
                            title: 'Successfully'
                        });
                        this.$Progress.finish();
                    })
                    .catch(error => {
                        this.errors = error.response.data.errors;
                        swal.fire({
                          type: 'error',
                          title: 'Error!!',
                          text: error.response.data.msg,
                          
                        })
                    })
            },
            activeEvents(){
                axios.get("/api/activeevents").then(({ data }) => (this.Active = data['events']));
            },
            getEventWeeks(){
                 axios.get("/api/geteventweeks/" + this.form.event).then(({ data }) => ([this.eventWeeks = data['week']]));
            },
            
        },
        created() {
            this.getChurches();
            this.loadWeeks();
            this. activeEvents();
            Fire.$on('AfterCreate', () => {
                this.getChurches();
                this.loadWeeks();
                this. activeEvents();
                
            });
        }
    }
</script>

<style scoped>

</style>