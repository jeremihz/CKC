<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;

class Communication extends Model
{
    use HasApiTokens;
    protected $table = 'communication';
    protected $guarded = [];
}
