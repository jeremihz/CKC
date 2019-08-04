<template>
    <div class="container-fluid">
        <div class="row mt-5" v-if="$gate.isPastor()">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Contribution</h3>

                        <div class="card-tools">
                            <button type="button" class="btn btn-primary" @click="newModal">
                                <i class="fa fa-donate"></i>
                                Make Contribution
                            </button>
                        </div>
                    </div>
                </div>
                <div class="col-sm-12" style="background-color: white; padding: 20px; margin-bottom: 20px;">
                    <h3>My Church(es)</h3>
                <div class="card" v-for="stat in stats" :key="stat.id">
                    <div class="card-header">
                        <b>{{stat.church_name}}</b>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-12 col-sm-6 col-md-4">
            <div class="info-box">
              <span class="info-box-icon bg-info elevation-1"><i class="fas fa-money-check-alt"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Target</span>
                <span class="info-box-number">
                    <small>Ksh. </small>
                  {{stat.target}}
                  
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>

            <div class="col-12 col-sm-6 col-md-4">
            <div class="info-box">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-hand-holding-usd"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Contribution</span>
                <span class="info-box-number">
                     <small>Ksh. </small>
                  {{stat.total_contributed}}
                  
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>

            <div class="col-12 col-sm-6 col-md-4">
            <div class="info-box">
              <span class="info-box-icon bg-success elevation-1"><i class="fas fa-percent"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Percentage</span>
                <span class="info-box-number">
                  {{stat.percentage}}
                  <small>%</small>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
                        </div>
                    </div>
                </div>
            </div>
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Contributions</h3>
                    </div>
                    <!-- /.card-header -->
                    <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Church</th>
                                <th>Amount</th>
                                <th>Date</th>
                                <th>Modify</th>
                               
                                
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="contrib in mycontributions" :key="contrib.id">
                                <td>{{ contrib.church }}</td>   
                                <td>{{ contrib.amount }}</td>                               
                                <td>{{ contrib.date | myDate }}</td>

                                   <td> 
                                    <button type="button" class="btn btn-sm btn-primary" @click="editModal(contrib)">
                                        <i class="fa fa-edit"></i>
                                    </button>
                                    <button type="button" class="btn btn-sm btn-danger" @click="deleteContribution(contrib.id)">
                                        <i class="fa fa-trash"></i>
                                    </button>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <!-- /.card-body -->
                </div>
                <!-- /.card -->
            </div>
        </div>
        <div class="modal fade" id="ContributionModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editMode" class="modal-title">Compose Message</h5>
                        <h5 v-show="editMode" class="modal-title">Edit Message</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editMode ? editMessage() :postContribution()">
                        <div class="modal-body">
                           
                           <div class="form-group">
                                <label for="church">church</label>
                                <select v-model="form.church" class="form-control" name="church" id="church"
                                        :class="{ 'is-invalid': form.errors.has('church') }">
                                    <option selected value="">--Select Church--</option>
                                    <option v-for="church in churches" :key="church.id" :value="church.id">{{ church.name}}</option>
                                </select>
                                <has-error :form="form" field="church"></has-error>
                            </div>
                            <div class="form-group">
                                <label for="amount">Amount Goal </label>
                                <input v-model="form.amount" type="text" class="form-control" name="amount" id="amount"
                                       placeholder="amount" :class="{ 'is-invalid': form.errors.has('amount') }">
                                <has-error :form="form" field="amount"></has-error>
                            </div>

                           

                        </div>

                        
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="!editMode" type="submit" class="btn btn-success">
                                <i class="fa fa-send"></i>
                                Post
                            </button>
                            <button v-show="editMode" type="submit" class="btn btn-primary">
                                <i class="fa fa-edit"></i>
                                Edit
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
        name: "Contribution",
        data() {
            return {
                editMode: false,
                messages: {},
                mycontributions: {},
                stats: {},
                churches: {},
                form: new Form({
                    id: '',
                    amount: '',
                    church: ''
                })
            }
        },
        methods: {
            editMessage() {
                this.$Progress.start();
                this.form.put('/api/mycontribution/' + this.form.id).then(() => {
                    Fire.$emit('AfterCreate');
                    $('#CommunicationModal').modal('hide');
                    swal.fire(
                        'Updated!',
                        'The message has been updated.',
                        'success'
                    )
                    his.$Progress.finish();
                }).catch(() => {
                    this.$Progress.fail();
                })
            },
            newModal() {
                this.editMode = false;
                this.form.reset();
                $('#ContributionModal').modal('show');
            },
            editModal(contrib) {
                this.editMode = true;
                this.form.reset();
                $('#ContributionModal').modal('show');
                this.form.fill(contrib);
            },
            deleteContribution(id) {
                swal.fire({
                    title: 'Are you sure?',
                    text: "You won't be able to revert this!",
                    type: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#3085d6',
                    cancelButtonColor: '#d33',
                    confirmButtonText: 'Yes, delete it!'
                }).then((result) => {
                    if (result.value) {
                        this.form.delete('api/contribution/' + id).then(() => {
                            swal.fire(
                                'Deleted!',
                                'Your file has been deleted.',
                                'success'
                            )
                            Fire.$emit('AfterCreate');

                        }).catch(() => {
                            swal.fire(
                                'Failed!',
                                'An error occurred.',
                                'warning'
                            )
                        });
                    }
                })
            },
            loadContributions() {
                axios.get("/api/mycontribution").then(({data}) => (this.mycontributions = data['mycontrib']));
            },
            loadStats() {
                axios.get("/api/mystats").then(({data}) => (this.stats = data['details']));
            },
            loadChurches() {
                axios.get("api/mychurches").then(({ data }) => ([this.churches = data['churches']]));
            },
            postContribution() {
                this.$Progress.start();
                this.form.post('api/contributionpastor')
                    .then(() => {
                        Fire.$emit('AfterCreate');
                        $('#ContributionModal').modal('hide');
                        toast.fire({
                            type: 'success',
                            title: 'Posted Successfully'
                        });
                        this.$Progress.finish();
                    })
                    .catch(() => {

                    })
            }
        },
        created() {
            this.loadContributions();
            this.loadStats();
            this.loadChurches();
            Fire.$on('AfterCreate', () => {
                this.loadContributions();
                this.loadStats();
            });
        }
    }
</script>

<style scoped>

</style>