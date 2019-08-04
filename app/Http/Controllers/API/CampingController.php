<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\User;
use App\Camping;
use App\Ministries;
use App\CampWeeks;
use App\Calendar;

class CampingController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $weeks = Camping::where('active', 1)->select('week')->distinct()->get();
        $weekly = array();

        foreach ($weeks as $week) {
            $week_number = $week['week'];
            $wee = array(
                'week_number'=>$week_number,
            );

            array_push($weekly, $wee);
        }

        return ['weekly'=>$weekly];
    }

    public function resetAll(){
        $guests = User::where('type', 'guest')->get();
        $churches = Ministries::all();
        $campings = Camping::where('active', 1)->get();

        foreach ($churches as $church) {
            $chrch = Ministries::find($church['id']);
            $chrch->week = 0;
            $chrch->update();
        }

        foreach ($guests as $guest) {
            $user = User::find($guest['id']);
            $user->week = 0;
            $user->update();
        }

        foreach ($campings as $camping) {
            $camp = Camping::find($camping['id']);
            $camp->active = 0;
            $camp->update();
        }

        return 'success';
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'week' => 'required',
            'church' => 'required',
            'no_guests' => 'required',
            'event' => 'required'
        ]);

        $week = $request['week'];
        $no_guests = $request['no_guests'];
        $church = $request['church'];


        $guests = User::where('type', 'guest')->where('week', '<', $week)->inRandomOrder()->take($no_guests)->get();

        if (count($guests) < $no_guests) {
                 $count = count($guests);
                 return response()->json([
                    'status' => 'error',
                    'msg'    => 'There are only '. $count. ' Guests remaining',
                ], 422);
            }else {

                foreach ($guests as $guest) {
                    
                    $ch = Ministries::find($church);
                    $ch->week = 1;
                    $ch->save();

                    $name = User::where('id', $guest['id'])->value('name');
                    $phone = User::where('id', $guest['id'])->value('phone');

                    $camping = new Camping();
                    $camping->user_id = $guest['id'];
                    $camping->church_id = $church;
                    $camping->name = $name;
                    $camping->event_id = $request['event'];
                    $camping->phone = $phone;
                    $camping->week = $week;

                    $camping->save();

                    $user = User::find($guest['id']);
                    $user->week = $week;
                    $user->update();
                }

                return 'Generated';
                    }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($week)
    {
        $church_ids = Camping::where('week', $week)->select('church_id')->where('active', 1)->distinct()->get();
        $camps = array();
        foreach ($church_ids as $church_id) {
            $camp = Camping::where('church_id', $church_id['church_id'])->where('active', 1)->get();
            $church_name = Ministries::where('id', $church_id['church_id'])->value('name');
            $church_location = Ministries::where('id', $church_id['church_id'])->value('location');
            $pastor_id = Ministries::where('id', $church_id['church_id'])->value('pastor');
            $pastor_name = User::where('id', $pastor_id)->value('name');
            $pastor_phone = User::where('id', $pastor_id)->value('phone');

            $cam = array(
               'church_name' => $church_name,
               'church_location' => $church_location,
               'pastor_name'=> $pastor_name,
               'pastor_phone' => $pastor_phone,
               'camp'=> $camp
            );

            array_push($camps, $cam);
        }

        return ['camps'=>$camps];
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function getEventWeeks($theevent)
    {
        $week = CampWeeks::where('event_id', $theevent)->get();
        return ['week'=>$week];
    }

    public function getCampDetails()
    {
        $bigevent = Calendar::where('status', 1)->first();
         
        return ['bigevent'=>$bigevent];
    }

    public function getWeek($dt){
        $bigevent = Calendar::where('status', 1)->first();
        $weekdet = CampWeeks::where('event_id', $bigevent['id'])->where('week', $dt)->first();

        return ['weekdet'=> $weekdet];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
