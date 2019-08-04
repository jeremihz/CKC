<?php

namespace App\Http\Controllers\API;

use App\Ministries;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class DashboardController extends Controller
{
    public function  index(){
        $total_churches= Ministries::all()->count();
        $total_pastor = User::where('type','pastor')->count();
        $total_users = User::all()->count();
        $total_guests = User::where('type','guest')->count();

        $data = array(
            'total_users'=>$total_users,
            'total_churches'=>$total_churches,
            'total_pastors'=>$total_pastor,
            'total_guest'=>$total_guests,
        );
        return['data'=>$data];
    }

}
