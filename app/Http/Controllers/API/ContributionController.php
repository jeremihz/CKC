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
    
        return Contribution::where('type', 'Target')->where('active', 1)->latest()->paginate(10);
        
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
            'amount' => 'required',
            'church' => 'required',
        ]);

        $type = 'Contribution';

        return Contribution::create([
            'church_id' => $request['church'],
            'type' =>$type,
            'amount' => $request['amount'],
            'user_id'=> auth()->user()->id,
        ]);
    }

    public function getStats(){
        // $church_id = Ministries::where('pastor', auth()->user()->id)->value('id');
        // $church_con = Contribution::where('church_id', $church_id)->where('type', 'Contribution')->get();
        // $total_contributed = collect($church_con)->where('type', 'Contribution')->sum('amount');
        // $target = Contribution::where('church_id', $church_id)->where('type', 'Target')->value('amount');
        // $perc = ($total_contributed/$target)*100;
        // $percentage = round($perc,2);

        // $details = array(
        //     'total_contributed' => $total_contributed, 
        //     'target' => $target,
        //     'percentage' => $percentage
        // );

        // return ['details'=> $details];

        $churches = Ministries::where('pastor', auth()->user()->id)->get();
        $details = array();

        foreach ($churches as $church) {
            $church_name = $church['name'];
            $church_con = Contribution::where('church_id', $church['id'])->where('type', 'Contribution')->get();
            $total_contributed = collect($church_con)->where('type', 'Contribution')->sum('amount');
            $target = Contribution::where('church_id', $church['id'])->where('type', 'Target')->value('amount');
            $perc = ($total_contributed/$target)*100;
            $percentage = round($perc,2);

            $det = array(
             'total_contributed' => $total_contributed, 
             'target' => $target,
             'percentage' => $percentage,
             'church_name' => $church_name
            );
            array_push($details, $det);
        }

        return ['details'=> $details];
    }

    public function myChurches(){
        $churches = Ministries::where('pastor', auth()->user()->id)->get();
        
        return ['churches'=> $churches];
    }

    public function loadChurches(){
        $churches = Ministries::where('contribution', 0)->get();
        
        return ['churches'=> $churches];
    }

    public function mycontribution(){
        // $church_id = Ministries::where('pastor', auth()->user()->id)->value('id');
        $myconts = Contribution::where('user_id', auth()->user()->id)->where('type', 'Contribution')->get();
        $mycontrib = array();

        foreach ($myconts as $mycont) {
            $amount = $mycont['amount'];
            $date = $mycont['created_at'];
            $church = Ministries::where('id', $mycont['church_id'])->value('name');

            $cont = array(
              'amount'=>$amount,
              'date'=>$date,
              'church'=>$church,
            );

            array_push($mycontrib, $cont);
        }

        return ['mycontrib'=> $mycontrib];
    }
    

    public function store(Request $request)
    {
        $this->validate($request, [
            'church' => 'required',
            'type' => 'required',
            'amount' => 'required'
        ]);

        $save = Contribution::create([
            'church_id' => $request['church'],
            'type' =>$request ['type'],
            'amount' => $request['amount'],
        ]);

        $church = Ministries::find($request['church']);
        $church->contribution = 1;
        $church->update();

        return 'success';
    }

    public function loadDetails(){
        $Contributions = Contribution::select('church_id')->where('active', 1)->distinct()->get();
        $cont = array();
        foreach ($Contributions as $Contribution) {
            $church_con = Contribution::where('church_id', $Contribution['church_id'])->where('active', 1)->get();
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
        $contributions = Contribution::where('church_id', $churchId)->where('type', 'Contribution')->where('active', 1)->get();
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
