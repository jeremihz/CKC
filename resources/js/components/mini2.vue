<template>
    <div class="container">
        <div class="row mt-5">
            <div class="col-md-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Ministries Table</h3>

                        <div class="card-tools">
                       <button class="btn btn-success" @click="newModal1">Add new Church<i class="fa fa-user-plus fa-fw"></i></button>
                        </div>
                    </div>
                    <!-- /.box-header -->
                    <div class="box-body table-responsive no-padding">
                        <table class="table table-hover">
                            <tbody><tr>

                                <th>Church Name</th>
                                <th>Location</th>
                                <th>Pastor</th>
                                <th>Contact</th>
                                <th>Registered At</th>
                                <th>Modify</th>
                            </tr>
                            <tr v-for="user in ministries" :key="user.id">

                                <td>{{user.name}}</td>
                                <td>{{user.location | upText}}</td>
                                <td>{{user.name_user }}</td>
                                <td>{{user.phone }}</td>
                                <td>{{user.created_at | myDate}}</td>
                                <td>
                                    <a href="#" @click="editModal1(user)" >
                                        <i class="fa fa-edit teal"></i>
                                    </a>
                                    <a href="#" @click="deleteUser1(user.id)">
                                        <i class="fa fa-trash red"></i>
                                    </a>
                                </td>
                            </tr>



                            </tbody></table>
                    </div>
                    <!-- /.box-body -->
                </div>
                <!-- /.box -->
            </div>
        </div>
        <!-- Modal -->
        <div class="modal fade" id="addnew" tabindex="-1" role="dialog" aria-labelledby="addnew" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content ">
                    <div class="modal-header">
                        <h5 class="modal-title" v-show="!editMode1" id="addnew">Add Ministry</h5>
                        <h5 class="modal-title" v-show="editMode1" id="addnew">Update Ministry info</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editMode1 ? updateUser() :createMinistry()">
                    <div class="modal-body">
                        <div class="form-group">
                            <input v-model="form.name" type="text" name="name" placeholder="Church Name"
                                   class="form-control" :class="{ 'is-invalid': form.errors.has('name') }">
                            <has-error :form="form" field="name"></has-error>
                        </div>
                        <div class="form-group">
                            <input v-model="form.location" type="text" name="location" placeholder="church Location"
                                   class="form-control" :class="{ 'is-invalid': form.errors.has('location') }">
                            <has-error :form="form" field="location"></has-error>
                        </div>



                        <div class="form-group">
                            <select name="pastor" v-model="form.ministries" id="pastor" class="form-control" :class="{ 'is-invalid': form.errors.has('pastor') }">
                                <option value="">Select Station pastor</option>
                                <option v-for="pastor in pastors" :key="pastor.id" :value="pastor.id">{{pastor.name}}</option>
                            </select>
                            <has-error :form="form" field="pastor"></has-error>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                        <button v-show="editMode1" type="submit" class="btn btn-primary">Edit</button>
                        <button v-show="!editMode1" type="submit" class="btn btn-primary">Add Ministry</button>
                    </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                editMode1: false,
                pastors :{},
                ministries:{},
                form: new Form({
                    id:'',
                    name:'',
                    location: '',
                    pastor:'',

                })


            }
        },
        methods:{
            getResults(page = 1) {
                axios.get('api/ministries?page=' + page)
                    .then(response => {
                        this.ministries = response.data.data;
                    });
            },
            updateUser(){
                this.$Progress.start();
            this.form.put('api/ministries/'+this.form.id)
                .then(()=>{
                    $('#addnew').modal('hide');
                    swal.fire(
                        'Edited!',
                        'Ministry information updated.',
                        'success'
                    )
                    this.$Progress.finish();
                    Fire.$emit('AfterCreate');
                })
                .catch(()=>{
                    this.$Progress.fail();

                })
            },
            editModal1(user){
                this.editMode1 = true;
                this.form.reset();
                this.form.fill(user);
                $('#addnew').modal('show');
            },
            newModal1(){
                this.editMode1 = false;
                this.form.reset();
                $('#addnew').modal('show');
            },
            deleteUser1(id){
                swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    // send the request to the controller
                    if (result.value) {
                    this.form.delete('api/ministries/'+ id).then(()=>{

                            swal.fire(
                                'Deleted!',
                                'Your file has been deleted.',
                                'success'
                            )
                            Fire.$emit('AfterCreate');

                    });
                    }
                }).catch(()=>{
                    swal("Failed!", "There was something wrong.", "warning");
                })
            },
            loadUsers(){
                axios.get("api/ministries").then(({ data }) => ([this.ministries = data['ministries']]));
                axios.get("api/ministries").then(({ data }) => ([this.pastors = data['users']]));
            },
            createMinistry(){
                this.$Progress.start();
                this.form.post('api/ministries')
            .then(() => {
                Fire.$emit('AfterCreate');
                $('#addnew').modal('hide')

                toast.fire({
                    type: 'success',
                    title: 'User Created in successfully'
                })
                this.$Progress.finish();
                })
                    .catch(() => {
                })
            }
        },


        created() {
            Fire.$on('searching', ()=>{
                let query = this.$parent.search;
                axios.get('api/findMinistries?q=' + query)
                    .then((data)=>{
                        this.ministries = data.data;
                        this.pastors = data.data;
                    })
                    .catch(()=>{

                    })
            })
            this.loadUsers();
            Fire.$on('AfterCreate', () =>{
                this.loadUsers();
            })
            //setInterval(() => this.loadUsers(), 3000);
        }
    }
</script>
