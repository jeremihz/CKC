<?php

namespace App\Http\Controllers\API;

use App\members;
use App\User;
use App\church;
use App\Ministries;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ChurchController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api');
    }

    /**
     * Display a listing of the resource.
     *
     * @return array
     */
    public function index()
    {
        $members = members::all();
        $membs = array();

        foreach ($members as $mem) {
            $church_name = Ministries::where('id', $mem['church_id'])->value('name');
            $location = Ministries::where('id', $mem['church_id'])->value('location');
            $total_members = $mem['total_members'];
            $new_members = $mem['new_members'];
            $dropped_members = $mem['dropped_members'];


            $minis = array(
                'church_name' => $church_name,
                'total_members' => $total_members,
                'new_members' => $new_members,
                'dropped_members' => $dropped_members,
                'location' => $location,
            );

            array_push($membs, $minis);
        }
        return ['members'=>$membs];
    }


    public function profile()
    {
        $user = auth()->user()->id;
        $church = Ministries::where('pastor', $user)->first();
        return $church;

    }

    public function update(Request $request)
    {
        $user = auth()->user()->id;
        $church = Ministries::where('pastor', $user)->value('id');
        $this->validate($request, [
            'name' => 'required|string|max:191',
            'total' => 'required|string|max:191',

        ]);
        return members::create([
            'church_id' => $church,
            'total_members' => $request['total'],
            'new_members' => $request['new'],
            'dropped_members' => $request['drop'],


        ]);

    }
    public function search(){
        if ($search = \Request::get('q')) {
            $users = Ministries::where(function($query) use ($search){
                $query->where('name','LIKE',"%$search%")
                    ->orWhere('location','LIKE',"%$search%");
            })->paginate(20);
        }else{
            $users = Ministries::latest()->paginate(10);
        }
        return $users;
    }
}
