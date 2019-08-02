
<template>
    <div class="container">
        <div class="card  mt-5">
            <div class="card-header">
                <h3 class="card-title"> {{this.form.name}} CHURCH MEMBERSHIP STATISTICS</h3>
            </div>
            <!-- /.card-header -->
            <!-- form start -->
            <form role="form">
                <div class="card-body">
                    <div class="form-group">
                        <label >Name of the church</label>
                        <input type="text" v-model="form.name" class="form-control"  placeholder="Enter church name" :class="{ 'is-invalid': form.errors.has('name') }">
                        <has-error :form="form" field="name"></has-error>
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
                form: new Form({
                    id:'',
                    name:'',
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
                       this.$Progress.finish();
                   })
                   .catch(()=>{
                       this.$Progress.fail();
                   });
            },


        },
        mounted() {

            console.log('Component mounted.')
        },
        created() {
            axios.get("api/churches")
                .then(({ data }) => (this.form.fill(data)));
        }
    }
</script>
