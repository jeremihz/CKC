<template>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="row mt-5">
                </div>
                <div class="card" style="margin-top: 20px;">
                        <div class="card-body table-responsive p-0">
                        <table class="table table-hover">
                            <thead>
                            <tr>
                                <th>Church</th>
                                <th>Location</th>
                                <th>Host</th>
                                <th>Guest</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr v-for="campDetail in weekDetails" :key="campDetail.id">
                                <td>{{ campDetail.church_name }}</td>
                                <td>{{ campDetail.church_location }}</td>
                                <td>
                                    {{ campDetail.pastor_name }} <br>
                                    {{ campDetail.pastor_phone }}
                                </td>
                                <td>
                                    <span v-for="guest in campDetail['camp']" :key="guest.id">
                                        {{ guest.name}}: {{ guest.phone}}
                                        <br>
                                    </span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    </div>
            </div>
        </div>
    </div>
</template>

<script>
    export default {
        data(){
          return{
              weekDetails: {},
              id: this.$route.params.week,
          }
        },
        methods: {
            weekDetail(){
                axios.get("/api/weekdetails/" + this.id).then(({ data }) => (this.weekDetails = data['camps']));
            }
        },
        created() {
            this.weekDetail();
        }
    }

</script>
