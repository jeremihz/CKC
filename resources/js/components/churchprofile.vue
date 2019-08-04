
<template>
    <div class="container">
        <div class="card  mt-5">
            <div class="card-header">
                <h3 class="card-title"> CHURCH MEMBERSHIP STATISTICS</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form role="form">
                <div class="card-body">
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
                        <label >church members last month</label>
                        <input type="text" v-model="form.total" class="form-control"  placeholder="Enter total number" :class="{ 'is-invalid': form.errors.has('name') }">
                        <has-error :form="form" field="total"></has-error>
                    </div>
                    <div class="form-group">
                        <label> members added last month</label>
                        <input type="text" v-model="form.new" class="form-control" placeholder="Enter total number" :class="{ 'is-invalid': form.errors.has('name') }">
                        <has-error :form="form" field="new"></has-error>
                    </div>
                    <div class="form-group">
                        <label> members drop last month</label>
                        <input type="text" v-model="form.drop"  class="form-control" placeholder="Enter total number" :class="{ 'is-invalid': form.errors.has('name') }">
                        <has-error :form="form" field="drop"></has-error>
                    </div>

                </div>
                <!-- /.card-body -->

                <div class="card-footer">
                    <button type="submit" @click.prevent="updateInfo" class="btn btn-primary">Submit</button>
                </div>
            </form>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
            return{
                churches:{},
                form: new Form({
                    id:'',
                    church:'',
                    total:'',
                    new:'',
                    drop:'',

                })
            }
        },
        methods:{

            updateInfo(){
                this.$Progress.start();
               this.form.put('api/members/')
                   .then(()=>{
                       Fire.$emit('AfterCreate');
                       this.form.reset();
                       swal.fire(
                           'Updated!',
                           'The message has been updated.',
                           'success'
                       )
                       this.$Progress.finish();
                   })
                   .catch(()=>{
                       this.$Progress.fail();
                   });
            },
            loadUsers(){
                axios.get("api/churches").then(({ data }) => ([this.churches = data['church']]));

            },

        },

        created() {
            this.loadUsers();
        }
    }
</script>