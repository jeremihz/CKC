<template>
    <div class="container-fluid">
        <div class="row mt-5">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Notice Board</h3>

                        <div class="card-tools">

                        </div>
                        <div class="card-body p-0">
                             <div class="row justify-content-center">
                                 <div class="col-md-10">
                                     <div class="card card-primary card-outline" v-for="mes in messages" :key="mes.id">
                                         <div class="card-body" style="padding-bottom: 15px;">
                                             <h5 class="card-title">{{ mes.title }}</h5>
                                             <small style="color: #3e63d5;">{{ mes.created_at }}</small>

                                             <p class="card-text">
                                                 {{ mes.message }}
                                             </p>
                                         </div>
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