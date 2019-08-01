<?php

namespace App\Http\Controllers\API;

use App\Ministries;
use App\User;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;

class MinistryController extends Controller
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
        $users = User::where('type', 'pastor')->get();
        $mins = Ministries::all();
        $ministries = array();

        foreach ($mins as $mini) {
            $name_user = User::where('id', $mini['pastor'])->value('name');
            $phone = User::where('id', $mini['pastor'])->value('phone');
            $church = $mini['name'];
            $location = $mini['location'];
            $registered = $mini['created_at'];
            $name = $mini['name'];
            $id = $mini['id'];

            $minis = array(
                'name_user' => $name_user,
                'name' => $name,
                'phone' => $phone,
                'church' => $church,
                'location' => $location,
                'registered' => $registered,
                'id' => $id
            );

            array_push($ministries, $minis);
        }

        return ['users' => $users, 'ministries' => $ministries];
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
            'name' => 'required|string|max:191',
            'location' => 'required|string|max:191',

        ]);
        return Ministries::create([
            'name' => $request['name'],
            'location' => $request['location'],
            'pastor' => $request['pastor'],


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
        $user = Ministries::findorFail($id);
        $this->validate($request, [
            'name' => 'required|string|max:191',
            'location' => 'required|string|max:191',



        ]);
        $user->update($request->all());

        return ['message' => 'user information updated'];
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param int $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $this->authorize('isAdmin');
        $user = Ministries::findOrFail($id);
        $user->delete();
        return ['message' => 'user deleted'];
    }

    public function search()
    {
        if ($search = \Request::get('q')) {
            $users = Ministries::where(function ($query) use ($search) {
                $query->where('name', 'LIKE', "%$search%")
                    ->orWhere('location', 'LIKE', "%$search%");

            });
        } else {
            $users = Ministries::latest();
        }
        return $users;
    }
}
