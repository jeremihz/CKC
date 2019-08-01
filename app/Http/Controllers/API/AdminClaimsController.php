<?php

namespace App\Http\Controllers\API;

use App\Claims;
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
        $ministries = Claims::select('ministry_id')->distinct()->get();
        $ministrys = array();
        foreach ($ministries as $ministry) {
            $mins = Claims::where('ministry_id', $ministry['ministry_id'])->get();
            $total_claims = collect($mins)->sum('amount');
            foreach ($mins as $min) {
                $ministry_id = $min['ministry_id'];
                $mi = array(
                    'ministry_id' => $ministry_id,
                    'total_claim' => $total_claims,
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
