<template>
    <div class="container-fluid">
        <div class="row justify-content-center">
            <div class="col-md-12">
                <div class="row mt-5">
                </div>
                <div class="card" style="margin-top: 20px;">
                    <div class="card-header">
                        <div class="card-tools">
                            <button type="button" class="btn btn-primary" @click="createPDF()">
                                <i class="fa fa-download"></i>
                                Download
                            </button>
                            <router-link to="/campmeeting" class="btn btn-primary">
                                <i class="fa fa-arrow-left"></i>
                                Back
                            </router-link>
                        </div>
                        <div class="card-body table-responsive p-0">
                        <table class="table table-hover" id="my-table">
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
    </div>
</template>

<script>
    export default {
        data(){
          return{
              weekDetails: {},
              campDetails: {},
              theWeek: {},
              id: this.$route.params.week,
          }
        },
        methods: {
            weekDetail(){
                axios.get("/api/weekdetails/" + this.id).then(({ data }) => (this.weekDetails = data['camps']));
            },
            getCampDetail(){
                axios.get("/api/campdetail").then(({ data }) => ([this.campDetails = data['bigevent']]));
                axios.get("/api/getweek/" + this.id).then(({ data }) => ([this.theWeek = data['weekdet']]));
            },
            createPDF () {
                var specialElementHandlers = {
                    "#editor":function(element, renderer){
                        return true;
                    }
                }
                var doc = new jsPDF();
                
                doc.setFontSize(18);
                doc.text(this.campDetails['event_name'], 14, 22);
                doc.setFontSize(11);
                doc.setTextColor(100);
                
                // jsPDF 1.4+ uses getWidth, <1.4 uses .width
                var pageSize = doc.internal.pageSize;
                var pageWidth = pageSize.width ? pageSize.width : pageSize.getWidth();
                var theme = doc.splitTextToSize(this.theWeek['week_name'] + '(' + this.theWeek['start_date'] + ' to ' + this.theWeek['end_date'] + ')', pageWidth - 35, {});
                doc.text(theme, 14, 30);
                var theme = doc.splitTextToSize('Theme: ' + this.campDetails['theme'], pageWidth - 35, {});
                doc.text(theme, 14, 40);
                var song = doc.splitTextToSize('Song: ' + this.campDetails['theme_song'], pageWidth - 35, {});
                doc.text(song, 14, 50);
                doc.autoTable({
                    showHead: 'firstPage',
                    html: '#my-table',
                    startY: 60,
                });
                doc.save('Week'+ this.id + '.pdf');
            }
        },
        created() {
            this.weekDetail();
            this.getCampDetail();
        }
    }

</script>
