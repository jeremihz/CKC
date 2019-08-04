<?php

namespace App\Http\Controllers\API;

use App\Claims;
use App\Ministries;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class AdminClaimsController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return array
     */
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    public function index()
    {
        $ministries = Claims::select('church_id')->where('active', 1)->distinct()->get();
        $ministrys = array();
        foreach ($ministries as $ministry) {
            $mins = Claims::where('church_id', $ministry['church_id'])->where('active', 1)->get();
            $total_claims = collect($mins)->sum('amount');
            foreach ($mins as $min) {
                $ministry_id = $min['church_id'];
                $church_name = Ministries::where('id', $ministry_id)->value('name');
                $church_location = Ministries::where('id', $ministry_id)->value('location');
                $mi = array(
                    'church_name'=>$church_name,
                    'ministry_id' => $ministry_id,
                    'total_claim' => $total_claims,
                    'church_location'=> $church_location
                );
                array_push($ministrys, $mi);

            }
        }

        $temp = array_unique(array_column($ministrys, 'ministry_id'));
        $unique_arr = array_intersect_key($ministrys, $temp);
        return $unique_arr;
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
    public function show($id)
    {
        //
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
