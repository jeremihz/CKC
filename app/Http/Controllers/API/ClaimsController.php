<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Claims;
use App\Camping;
use App\Ministries;
use App\Calendar;
use Illuminate\Support\Facades\Auth;

class ClaimsController extends Controller
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
        $claims = Claims::latest()->where('user_id', auth()->user()->id)->where('active', 1)->get();
        $claimings = array();

        foreach ($claims as $claim) {
            $church_name = Ministries::where('id', $claim['church_id'])->value('name');
            $event_name = Calendar::where('id', $claim['event_id'])->value('event_name');

            $clai = array(
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

    public function getChurches()
    {
        $assignedChurches = Camping::where('user_id', auth()->user()->id)->where('active', 1)->get();
        $churches = array();

        foreach ($assignedChurches as $assignedChurch) {
            $name = Ministries::where('id', $assignedChurch['church_id'])->value('name');
            $id = $assignedChurch['church_id'];

            $church = array(
               'name'=>$name,
               'id'=>$id,
            );

            array_push($churches, $church);
        }

        return ['churches'=>$churches];
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'title' => 'required|string',
            'event' => 'required',
            'amount' => 'required',
            'church' => 'required'
        ]);
//        $user = Auth::user();

        return Claims::create([
            'title' => $request['title'],
            'event_id' => $request['event'],
            'church_id'=>$request['church'],
            'from_start' => $request['from_start'],
            'to_destination' => $request['to_destination'],
            'amount' => $request['amount'],
            'journey' => $request['journey'],
            'user_id' => auth()->user()->id,
        ]);
    }

    /**
     * Display the specified resource.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
}
