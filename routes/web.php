<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('welcome');
});

Route::resource('books', 'BookController');
Route::get('books/{uuid}/download', 'BookController@download')->name('books.download');

Route::post('/image/store', 'ImageController@store');

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');



Route::post('/image/store' , 'ImageController@store');

Route::get('{path}','HomeController@index')->where( 'path', '([A-z\d\-/_.]+)?' );

 ////////////////////////////// Contributions //////////////////////////
    Route::resource('contribution', 'ContributionsController');
    Route::get('contribution-giving/create', 'ContributionsController@givingCreate')->name('contribution_giving.create');
    Route::post('contribution-giving/store', 'ContributionsController@givingStore')->name('contribution_giving.store');
    Route::get('contribution-giving/{id}/show', 'ContributionsController@givingShow')->name('contribution_giving.show');
    Route::get('contribution-giving/{id}/edit', 'ContributionsController@givingEdit')->name('contribution_giving.edit');
    Route::PATCH('contribution-giving/{id}/update', 'ContributionsController@givingUpdate')->name('contribution_giving.update');
    Route::delete('contribution-giving/{id}/destroy', 'ContributionsController@givingDelete')->name('contribution_giving.destroy');
    Route::resource('pledge', 'PledgesController');



