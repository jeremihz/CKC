<template>
    <div class="container-fluid">
        <div class="row mt-5" v-if="$gate.isGuest() || $gate.isPastor()">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Notice Board</h3>

                        <div class="card-tools">

                        </div>
                        <div class="card-body p-0">
                             <div class="row">
                                 <div class="col-md-6" v-for="mes in messages" :key="mes.id">

                                    <div class="alert alert-success alert-dismissible">
                                      <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                      <h5><i class="icon fas fa-info"></i><b>{{ mes.title }}</b></h5>
                                      <small style="color: #fff;">{{ mes.created_at }}</small><br>
                                      <read-more more-str="read more" :text="mes.message" link="#" less-str="read less" :max-chars="50"></read-more>
                                    </div>
                                 </div>
                             </div>
                        </div>
                    </div>
                </div>
                <!-- /.card -->
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        name: "Notice",
        data() {
            return {
                messages: {},
            }
        },
        methods: {
            loadMessages() {
                axios.get("api/communication").then(({data}) => (this.messages = data.data));
            },
        },
        created() {
            this.loadMessages();
        }
    }
</script>

<style scoped>

</style>