<?php

namespace App\Http\Controllers\API;

use App\Claims;
use App\User;
use App\Ministries;
use App\Calendar;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ClaimDetailsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function index()
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($ministryId)
    {
        $claims = Claims::where('church_id', $ministryId)->where('active', 1)->latest()->get();
        $claimings = array();

        foreach ($claims as $claim) {
            $church_name = Ministries::where('id', $claim['church_id'])->value('name');
            $event_name = Calendar::where('id', $claim['event_id'])->value('event_name');
            $user_name = User::where('id',  $claim['user_id'])->value('name');

            $clai = array(
              'user_name'=> $user_name,
              'amount'=>$claim['amount'],
              'title'=>$claim['title'],
              'from_start'=>$claim['from_start'],
              'to_destination'=>$claim['to_destination'],
              'journey'=>$claim['journey'],
              'church_name'=>$church_name,
              'event_name'=>$event_name
            );

            array_push($claimings, $clai);
        }

        return ['claimings'=>$claimings];
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
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
