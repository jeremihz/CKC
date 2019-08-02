<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Contribution;
use App\Ministries;
use Auth;

class ContributionController extends Controller
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
    
        return Contribution::where('type', 'Target')->latest()->paginate(10);
        
    }


    public function Admin()
    {
    	$church = Ministries::where('pastor', Auth::user()->id)->first();
    	$church_id = $church->id;
    	$Cont = Contribution::where('church_id', $church_id)->first();
    	$church_name = $church->name;
    	$target = $Cont->amount;
    	$contributed = $Cont->contributed;

    	$contri  = array(
    		'name' => $church_name,
    		'target' => $target,
    		'contributed'=> $contributed 
    	);
        return ['contri'=>$contri];
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */

     public function storepastor(Request $request)
    {
        $this->validate($request, [
            'amount' => 'required'
        ]);

        $church_id = Ministries::where('pastor', auth()->user()->id)->value('id');
        $type = 'Contribution';

        return Contribution::create([
            'church_id' => $church_id,
            'type' =>$type,
            'amount' => $request['amount'],
        ]);
    }

    public function getStats(){
        $church_id = Ministries::where('pastor', auth()->user()->id)->value('id');
        $church_con = Contribution::where('church_id', $church_id)->where('type', 'Contribution')->get();
        $total_contributed = collect($church_con)->where('type', 'Contribution')->sum('amount');
        $target = Contribution::where('church_id', $church_id)->where('type', 'Target')->value('amount');
        $perc = ($total_contributed/$target)*100;
        $percentage = round($perc,2);

        $details = array(
            'total_contributed' => $total_contributed, 
            'target' => $target,
            'percentage' => $percentage
        );

        return ['details'=> $details];
    }

    public function mycontribution(){
        $church_id = Ministries::where('pastor', auth()->user()->id)->value('id');
        $mycont = Contribution::where('church_id', $church_id)->where('type', 'Contribution')->get();

        return ['mycont'=> $mycont];
    }
    

    public function store(Request $request)
    {
        $this->validate($request, [
            'church' => 'required',
            'type' => 'required',
            'amount' => 'required'
        ]);

        return Contribution::create([
            'church_id' => $request['church'],
            'type' =>$request ['type'],
            'amount' => $request['amount'],
        ]);
    }

    public function loadDetails(){
        $Contributions = Contribution::select('church_id')->distinct()->get();
        $cont = array();
        foreach ($Contributions as $Contribution) {
            $church_con = Contribution::where('church_id', $Contribution['church_id'])->get();
            $total_contributed = collect($church_con)->where('type', 'Contribution')->sum('amount');
            $church_id = $Contribution['church_id'];
            $church_name = Ministries::where('id', $church_id)->value('name');

            $church_target = Contribution::where('church_id', $Contribution['church_id'])->where('type', 'Target')->value('amount');
            $perc = ($total_contributed/$church_target)*100;
            $percentage = round($perc,2);

            $con = array(
                'total_contributed' => $total_contributed,
                'church_target' => $church_target,
                'church_id'=>$church_id,
                'church_name'=> $church_name,
                'percentage' => $percentage
            );

            array_push($cont, $con);
        }

        $temp = array_unique(array_column($cont, 'church_id'));
        $unique_arr = array_intersect_key($cont, $temp);

        return ['unique_arr'=> $unique_arr];
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($churchId)
    {
        $contributions = Contribution::where('church_id', $churchId)->where('type', 'Contribution')->get();
        return ['contributions'=>$contributions];
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
        $contribution = Contribution::findorfail($id);
        $contribution->delete();
    }
}
