<template>
    <div class="container-fluid">
        <div class="row justify-content-center" v-if="$gate.isAdmin()">
            <div v-if="!$gate.isAdmin()">
                        <not-found></not-found>
                    </div>
            <div class="col-md-12">
                <div class="row mt-5">
                </div>
                <div class="card" style="margin-top: 20px;">
                    <div class="card-header">
                        <div class="card-tools">
                            <button type="button" class="btn btn-primary" @click="newModal">Add Weeks</button>
                        </div>
                        <div class="card-body table-responsive p-0">
                        <table class="table table-hover" id="my-table">
                            <thead>  
                            <tr>
                                <th>Name</th>
                                <th>Start</th>
                                <th>End</th>
                                <th>Theme</th>
                                <th>Theme Song</th>
                                <th>Complete</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="event in Events" :key="event.id">
                                <td>{{ event.event_name }}</td>
                                <td>{{ event.start_date }}</td>
                                <td>
                                    {{ event.end_date }} <br>
                                </td>
                                <td>
                                    {{ event.theme }} <br>
                                </td>
                                <td>
                                    {{ event.theme_song }} <br>
                                </td>
                                <td>
                                    <button v-if="event.status == 1" type="button" class="btn btn-primary" @click="markComplete(event.id)">Mark Complete</button>
                                    <button type="button" class="btn btn-success" v-if="event.status == 0">Completed</button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    </div>
                    </div>
            </div>
        </div>
        <div class="modal fade" id="WeeksModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">Edit Message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="addWeek()">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="event">Event</label>
                                <select v-model="form.event" class="form-control" name="event" id="event"
                                        :class="{ 'is-invalid': form.errors.has('event') }">
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
                                    <option value="1">Week 1</option>
                                    <option value="2">Week 2</option>
                                    <option value="3">Week 3</option>
                                    <option value="4">Week 4</option>
                                    <option value="5">Week 5</option>
                                    <option value="6">Week 6</option>
                                    <option value="7">Week 7</option>
                                    <option value="8">Week 8</option>
                                </select>
                                <has-error :form="form" field="week"></has-error>
                            </div>
                           
                            <div class="form-group">
                                <label for="amount">Start Date </label>
                                <input v-model="form.start_date" type="date" class="form-control" name="start_date" id="start_date"
                                       placeholder="start_date" :class="{ 'is-invalid': form.errors.has('start_date') }">
                                <has-error :form="form" field="start_date"></has-error>
                            </div>

                            <div class="form-group">
                                <label for="end_date">End Date </label>
                                <input v-model="form.end_date" type="date" class="form-control" name="end_date" id="end_date"
                                       placeholder="end_date" :class="{ 'is-invalid': form.errors.has('end_date') }">
                                <has-error :form="form" field="end_date"></has-error>
                            </div>

                        </div>

                        
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-success">
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
        name: "ViewEvents",
        data(){
          return{
              Events: {},
              Active: {},
              form: new Form({
                    id: '',
                    week:'',
                    event: '',
                    start_date:'',
                    end_date: '',
                })
          }
        },
        methods: {
            getEvents(){

                axios.get("/api/allevents").then(({ data }) => (this.Events = data['events']));
            },
            markComplete(id){
                Fire.$emit('AfterCreate');
                axios.put("/api/makecomplete/" + id).then();
            },
            newModal() {
                this.form.reset();
                $('#WeeksModal').modal('show');
            },
            activeEvents(){
                axios.get("/api/activeevents").then(({ data }) => (this.Active = data['events']));
            },
            addWeek(){
               this.$Progress.start();
                this.form.post('api/saveweeks')
                    .then(() => {
                        Fire.$emit('AfterCreate');
                        $('#WeeksModal').modal('hide');
                        toast.fire({
                            type: 'success',
                            title: 'Posted Successfully'
                        });
                        this.$Progress.finish();
                    })
                    .catch(error =>{
                         this.errors = error.response.data.errors;
                        swal.fire({
                          type: 'error',
                          title: 'Error!!',
                          text: error.response.data.msg,
                          
                        })
                    })
            }
        },
        created() {
            this.getEvents();
            this. activeEvents();
            Fire.$on('AfterCreate', () => {
                this.getEvents();
                this. activeEvents();
            });
        }
    }

</script>
