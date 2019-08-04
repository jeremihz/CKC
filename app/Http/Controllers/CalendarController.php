<?php

namespace App\Http\Controllers;

use App\Calendar;
use Illuminate\Http\Request;
use App\Http\Resources\CalendarResource;
use Symfony\Component\HttpFoundation\Response;
use App\CampWeeks;

class CalendarController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        return CalendarResource::collection(Calendar::all());
    }


    public function allEvents()
    {
        $events = Calendar::all();
        return ['events'=> $events];
    }

    public function activeEvents()
    {
        $events = Calendar::where('status', 1)->get();
        return ['events'=> $events];
    }

    public function makeComplete($id){
        $event = Calendar::find($id);
        $event->status = 0;
        $event->update();
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $new_calendar = Calendar::create($request->all());
        return response()->json([
            'data' => new CalendarResource($new_calendar),
            'message' => 'Successfully added new event!',
            'status' => Response::HTTP_CREATED
        ]);
    }

    public function storeweeks(Request $request)
    {
        $this->validate($request, [
            'event' => 'required',
            'week' => 'required',
            'start_date' => 'required',
            'end_date' => 'required'
        ]);

        $exist = CampWeeks::where('event_id', $request['event'])->where('week', $request['week'])->get();

        if(count($exist) > 0){
             return response()->json([
                    'status' => 'error',
                    'msg'    => 'The week already exists',
                ], 422);
        }else{

        return CampWeeks::create([
            'event_id' => $request['event'],
            'week' => $request['week'],
            'start_date' => $request['start_date'],
            'week_name' => 'Week ' . $request['week'],
            'end_date' => $request['end_date'],
        ]);
    }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Calendar  $calendar
     * @return \Illuminate\Http\Response
     */
    public function show(Calendar $calendar)
    {
        return response($calendar, Response::HTTP_OK);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Calendar  $calendar
     * @return \Illuminate\Http\Response
     */
    public function edit(Calendar $calendar)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Calendar  $calendar
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Calendar $calendar)
    {
        $calendar->update($request->all());
        return response()->json([
            'data' => new CalendarResource($calendar),
            'message' => 'Successfully updated event!',
            'status' => Response::HTTP_ACCEPTED
        ]);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Calendar  $calendar
     * @return \Illuminate\Http\Response
     */
    public function destroy(Calendar $calendar)
    {
        $calendar->delete();
        return response('Event removed successfully!', Response::HTTP_NO_CONTENT);
    }
}
