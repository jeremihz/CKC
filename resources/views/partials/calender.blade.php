 <div class="panel panel-primary">
          <div class="panel-heading text-right">
              <button id="create_event"  type="button" class="btn btn-success btn-md"><i class="fa fa-plus"></i> Create Event</button>
          </div>
          <div class="panel-body">
              
              <div id="alert_tmeassage_area"></div>
           
            <div id='calendar'>
            </div>
          </div>
        </div>
        <!--     Create Event  -->        
        <div class="modal fade" id="create_event_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog" >
            <div class="modal-content">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Create Event</h4>
              </div>
              <div class="modal-body">
                <div id="create_event_alert"></div>
                <form id="create_event_frm"  action="{{route('event')}}"  method="post" enctype="multipart/form-data"  >
                   
                  <div class="row">
                    <div class="col-lg-12 col-xs-12">
                      <div class="form-group">
                        <input type="text" name="event_title" id="event_title" required=""  class="form-control" placeholder="Event Title">
                        <input  type="hidden" id="set_start_time_data" value="No" />  
                        <input  type="hidden" id="set_end_time_data" value="No" />  
                        <input  type="hidden" name="set_end_date_data" id="set_end_date_data" value="No" />  
                      </div>
                    </div>
                  </div>
                  <div class="row">
                    <div class="pull-left" style="width: 75%;">
                      <div class="col-lg-5 col-xs-12">
                        <div class="form-group">
                          <input type="text"   name="event_start_date" required="" id="event_start_date" value="" class="form-control date_pick" placeholder="Start Date">
                        </div>
                      </div>
                      <div class="col-lg-2 col-xs-2">
                        <div id="start_time_toggle">
                            <button type="button"  class="btn btn-md"  title="Add Start Time" onclick="add_start_time()"> 
                          <i class="text-success fa fa-plus"></i>
                          <i class="text-success fa fa-clock"></i>
                          </button>  
                        </div>
                      </div>
                      <div class="col-lg-5 col-xs-12" id="event_start_time_area" style="display: none">
                        <!--                                 none-->
                        <div class="form-group">
                          <input type="text"   name="event_start_time" id="event_start_time" value="12:00 AM" class="form-control time_pick" placeholder="Start Time">
                        </div>
                      </div>
                    </div>
                    <div class="pull-right" >
                      <div class="col-lg-2 col-xs-2">
                        <div id="end_date_toggle">
                          <button type="button" class="btn btn-md"  onclick="add_end_date()" style="width: 117px" >
                          <i class="text-success fa fa-plus"></i> End Date</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="section row" id="end_date_area" style="display: none">
                    <!--                            none-->
                    <div class="pull-left" style="width: 75%;">
                      <div class="col-lg-5 col-xs-12">
                        <div class="form-group">
                          <input type="text"   name="event_end_date" id="event_end_date" value="" class="form-control date_pick" placeholder="End Date">
                        </div>
                      </div>
                      <div class="col-lg-2 col-xs-2">
                        <div id="end_time_toggle">
                          <button type="button"  class="btn btn-md"  title="Add End Time"  onclick="add_end_time()"> 
                          <i class="text-success fa fa-plus"></i>
                          <i class="text-success fa fa-clock"></i>
                          </button>  
                        </div>
                      </div>
                      <div class="col-lg-5 col-xs-12" id="event_end_time_area" style="display: none">
                        <!--                    //none-->
                        <input type="text"   name="event_end_time" id="event_end_time" value="11:59 PM" class="form-control time_pick" placeholder="End Time">
                      </div>
                    </div>
                    <div class="pull-right">
                      <div class="col-lg-2 col-xs-2">
                        <button type="button" class="btn btn-md" onclick="remove_end_date()" style="width: 117px" > <i class="text-danger fa fa-times"></i> Remove</button>
                      </div>
                    </div>
                  </div>
                
                  <div class="section row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <textarea class="form-control" id="event_description" name="event_description" placeholder="Description" ></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="section" style="margin-top: 10px">
                    <div  class="text-right" id="event_image_error_msg"></div>
                    <p class="text-right">
                        <button type="button" id="create_event_btn"  class="btn btn-primary">Save</button>
                    </p>
                  </div>
                  <!-- end section row -->
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
              </div>
            </div>
          </div>  
        </div>
        
        
        
        <!--     Edit Event  -->
        <div class="modal fade" id="edit_event_modal" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
          <div class="modal-dialog" >
            <div class="modal-content admin-form">
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                <h4 class="modal-title" id="myModalLabel">Edit Event</h4>
              </div>
              <div class="modal-body">
                <div id="edit_event_alert"></div>
                <form id="edit_event_frm" action=""  method="post" enctype="multipart/form-data"  >
                     {{ csrf_field() }}

                  <div class="row">
                    <div class="col-lg-12 col-xs-12">
                      <div class="form-group">
                        <label class="">Event Title</label>
                        <input type="text" name="event_title" id="edit_event_title" required=""  class="form-control" placeholder="Event Title">
                      </div>
                      <input type="hidden" id="edit_event_id" value="" name="id" />  
                      <input type="hidden" id="edit_set_start_time_data" value="Yes" />  
                      <input type="hidden" id="edit_set_end_time_data" value="Yes" />  
                      <input type="hidden" name="set_end_date_data" id="edit_set_end_date_data" value="Yes" />  
                    </div>
                  </div>
                  <div class=" row">
                    <div class="pull-left" style="width: 75%;">
                      <div class="col-lg-5 col-xs-12">
                        <div class="form-group">
                          <label class="">Start Date</label>
                          <input type="text"   name="event_start_date" required="" id="edit_event_start_date" value="" class="form-control date_pick" placeholder="Start Date">
                        </div>
                      </div>
                      <div class="col-lg-2 col-xs-2">
                        <div id="edit_start_time_toggle" class="mt30">
                          <button type="button"  class="btn btn-md" title="Remove Start Time"   onclick="edit_remove_start_time()"> 
                          <i class="text-danger fa fa-times"></i>
                          <i class="text-danger fa fa-clock"></i>
                          </button>  
                        </div>
                      </div>
                      <div class="col-lg-5 col-xs-12" id="edit_event_start_time_area" style="display: block">
                        <div class="form-group">
                          <label class="">Start Time</label>
                          <input type="text"   name="event_start_time" id="edit_event_start_time" value="" class="form-control time_pick" placeholder="Start Time">
                        </div>
                      </div>
                    </div>
                    <div class="pull-right" >
                      <div class="col-lg-2 col-xs-2">
                        <div id="edit_end_date_toggle" class="mt30" style="display: none" >
                          <button type="button" class="btn btn-md"  onclick="edit_add_end_date()" style="width: 117px" >
                          <i class="text-success fa fa-plus"></i> End Date</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="row" id="edit_end_date_area" style="display: block">
                    <div class="pull-left" style="width: 75%;">
                      <div class="col-lg-5 col-xs-12">
                        <div class="form-group">
                          <label class="">End Date</label>
                          <input type="text"   name="event_end_date" id="edit_event_end_date" value="" class="form-control date_pick" placeholder="End Date">
                        </div>
                      </div>
                      <div class="col-lg-2 col-xs-2">
                        <div id="edit_end_time_toggle" class="mt30">
                          <button type="button"  class="btn btn-md" title="Remove End Time"   onclick="edit_remove_end_time()"> 
                          <i class="text-danger fa fa-times"></i>
                          <i class="text-danger fa fa-clock"></i>
                          </button>  
                        </div>
                      </div>
                      <div class="col-lg-5 col-xs-12" id="edit_event_end_time_area" style="display: block">
                        <div class="form-group">
                          <label class="">End Time</label>
                          <input type="text"   name="event_end_time" id="edit_event_end_time" value="" class="form-control time_pick" placeholder="End Time">
                        </div>
                      </div>
                    </div>
                    <div class="pull-right">
                      <div class="col-lg-2 col-xs-2 mt30" >
                        <button type="button" class="btn btn-md" onclick="edit_remove_end_date()" style="width: 117px" > <i class="text-danger fa fa-times"></i> Remove</button>
                      </div>
                    </div>
                  </div>
                  
                  <div class="row">
                    <div class="col-md-12">
                      <div class="form-group">
                        <label class="">Event Description</label>
                        <textarea class="form-control" id="edit_event_description" name="event_description" placeholder="Description" ></textarea>
                      </div>
                    </div>
                  </div>
                  <div class="section" style="margin-top: 10px">
                    <p class="text-right">
                      <button type="button" id="edit_event_btn"  class="btn btn-primary">Update</button>
                    </p>
                  </div>
                  <!-- end section row -->
                </form>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
              </div>
            </div>
          </div>
        </div>