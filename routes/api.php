<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});
Route::apiResources(['user'=>'API\UserController']);
Route::apiResources(['ministries'=>'API\MinistryController']);
Route::apiResources(['church'=>'API\ChurchController']);
Route::get('profile','API\UserController@profile');
Route::put('profile','API\UserController@updateProfile');
Route::get('findUser','API\UserController@search');
Route::get('findMinistries','API\MinistryController@search');
Route::get('pastors','API\UserController@profiles');
Route::get('churches','API\ChurchController@profile');
Route::put('members','API\ChurchController@update');
Route::get('findChurch','API\ChurchController@search');

Route::apiResource('/calendar', 'CalendarController');
Route::get('/allevents', 'CalendarController@allEvents');
Route::put('/makecomplete/{id}', 'CalendarController@makeComplete');
Route::get('/activeevents', 'CalendarController@activeEvents');
Route::post('/saveweeks','CalendarController@storeweeks');

Route::apiResource('employees', 'EmployeesController');
Route::apiResources(['contribution'=>'API\ContributionController']);



Route::apiResources([
    'communication'=>'API\CommunicationController',
    'claims'=>'API\ClaimsController',
    'claims-admin'=>'API\AdminClaimsController',
    'contribution'=>'API\ContributionController',
    // 'files' => 'ImageController',
]);

Route::get('/claimdetails/{ministryId}','API\ClaimDetailsController@show');
// Route::get('/contribution','API\ContributionController@index');
Route::get('/files','ImageController@index');
Route::get('/download/{fileName}','ImageController@download');

Route::get('/contrDetails','API\ContributionController@loadDetails');
Route::get('/churchdetails/{churchId}','API\ContributionController@show');
Route::post('/contributionpastor','API\ContributionController@storepastor');
Route::get('/mycontribution','API\ContributionController@mycontribution');
Route::get('/mystats','API\ContributionController@getStats');
Route::get('/mychurches','API\ContributionController@myChurches');

Route::get('getChurches','API\ChurchController@getChurches');


Route::post('/createmeeting','API\CampingController@store');
Route::get('getWeekNumber','API\CampingController@index');
Route::put('reset','API\CampingController@resetAll');
Route::get('weekdetails/{week}','API\CampingController@show');
Route::get('weekdetails/{week}','API\CampingController@show');
Route::get('geteventweeks/{theevent}','API\CampingController@getEventWeeks');
Route::get('campdetail','API\CampingController@getCampDetails');
Route::get('getweek/{dk}','API\CampingController@getWeek');

