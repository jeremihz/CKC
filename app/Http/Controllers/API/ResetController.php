<?php

namespace App\Http\Controllers\API;

use App\Contribution;
use App\Ministries;
use App\Claims;
use App\User;
use App\Camping;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ResetController extends Controller
{
    public function newYear(){
    	$contributions = Contribution::where('active', 1)->get();
        $churches = Ministries::where('contribution', 1)->get();
        $claims = Claims::where('active', 1)->get();
        $guests = User::where('type', 'guest')->get();
        $churches = Ministries::all();
        $campings = Camping::where('active', 1)->get();

    	foreach ($contributions as $contribution) {
    		$cont = Contribution::find($contribution['id']);
	        $cont->active = 0;
	        $cont->update();
    	}

    	foreach ($churches as $church) {
    		$chur = Ministries::find($church['id']);
	        $chur->contribution = 0;
	        $chur->update();
    	}

    	foreach ($claims as $claim) {
    		$clai = Claims::find($claim['id']);
	        $clai->active = 0;
	        $clai->update();
    	}

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
}
