<template>
    <div class="container-fluid">
        <div class="row mt-5" v-if="$gate.isGuest()">
            <div class="col-12">
                <div class="card">
                    <div class="card-header">
                        <h3 class="card-title">Claim</h3>

                        <div class="card-tools">
                            <button type="button" class="btn btn-primary" @click="newModal">
                                <i class="fa fa-pencil"></i>
                                Make Claim
                            </button>
                        </div>
                        <div class="card-body table-responsive p-0">
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>Title</th>
                                    <th>Date</th>
                                    <th>Event</th>
                                    <th>From</th>
                                    <th>To</th>
                                    <th>Amount</th>
                                    <th>Journey</th>
                                </tr>
                                </thead>
                                <tbody>
                                <tr v-for="claim in claims" :key="claim.id">
                                    <td>{{ claim.title }}</td>
                                    <td>{{ claim.created_at | myDate }}</td>
                                    <td>{{ claim.event }}</td>
                                    <td>{{ claim.from_start }}</td>
                                    <td>{{ claim.to_destination }}</td>
                                    <td><span class="tag tag-success">{{ claim.amount }}</span></td>
                                    <td>{{ claim.journey }}</td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- /.card -->
            </div>
        </div>
        <div class="modal fade" id="ClaimModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 v-show="!editMode" class="modal-title">Make Claim</h5>
                        <h5 v-show="editMode" class="modal-title">Edit Claim</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <form @submit.prevent="editMode ? editClaim() :makeClaim()">
                        <div class="modal-body">
                            <div class="form-group">
                                <label for="event">Title</label>
                                <select v-model="form.title" class="form-control" name="title" id="title"
                                        :class="{ 'is-invalid': form.errors.has('title') }">
                                    <option selected value="">--Select Title--</option>
                                    <option value="Meal">Meal</option>
                                    <option value="Transport">Transport</option>
                                </select>
                                <has-error :form="form" field="title"></has-error>
                            </div>
                            <div class="form-group" v-if="form.title=='Transport'">
                                <label for="from_start">From</label>
                                <input v-model="form.from_start" type="text" class="form-control" name="from_start"
                                       id="from_start" :class="{ 'is-invalid': form.errors.has('from_start') }">
                                <has-error :form="form" field="from_start"></has-error>
                            </div>
                            <div class="form-group" v-if="form.title=='Transport'">
                                <label for="to_destination">To (Destination)</label>
                                <input v-model="form.to_destination" type="text" class="form-control" name="to_destination"
                                       id="to_destination" :class="{ 'is-invalid': form.errors.has('to_destination') }">
                                <has-error :form="form" field="to_destination"></has-error>
                            </div>
                            <div class="form-group" v-if="form.title=='Transport'">
                                <label for="event">Journey</label>
                                <select v-model="form.journey" class="form-control" name="journey" id="journey"
                                        :class="{ 'is-invalid': form.errors.has('journey') }">
                                    <option selected value="">--Select Journey--</option>
                                    <option value="Arrival">Arrival</option>
                                    <option value="Departure">Departure</option>
                                </select>
                                <has-error :form="form" field="journey"></has-error>
                            </div>
                            <div class="form-group">
                                <label for="event">Event</label>
                                <select v-model="form.event" class="form-control" name="event" id="event"
                                        :class="{ 'is-invalid': form.errors.has('event') }">
                                    <option selected value="">--Select Status--</option>
                                    <option value="One">Event One</option>
                                    <option value="Two">Event Two</option>
                                </select>
                                <has-error :form="form" field="event"></has-error>
                            </div>
                            <div class="form-group">
                                <label for="amount">Amount</label>
                                <input v-model="form.amount" type="number" class="form-control" name="amount"
                                       id="amount" :class="{ 'is-invalid': form.errors.has('amount') }">
                                <has-error :form="form" field="amount"></has-error>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                            <button v-show="!editMode" type="submit" class="btn btn-success">
                                <i class="fa fa-send"></i>
                                Make
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
        name: "CampClaims",
        data() {
            return {
                editMode: false,
                claims: {},
                form: new Form({
                    title: '',
                    from_start: '',
                    to_destination: '',
                    event:'',
                    amount: '',
                    journey: '',
                })
            }
        },
        methods: {
            newModal() {
                this.editMode = false;
                this.form.reset();
                $('#ClaimModal').modal('show');
            },
            loadMyClaims() {
                axios.get("api/claims").then(({data}) => (this.claims = data.data));
            },
            makeClaim() {
                this.$Progress.start();
                this.form.post('api/claims')
                    .then(() => {
                        Fire.$emit('AfterCreate');
                        $('#ClaimModal').modal('hide');
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
            this.loadMyClaims();
            Fire.$on('AfterCreate', () => {
                this.loadMyClaims();
            });
        }
    }
</script>

<style scoped>

</style>