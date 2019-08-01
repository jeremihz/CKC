<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Laravel\Passport\HasApiTokens;

class Claims extends Model
{
    use HasApiTokens;

    protected $table = 'claims';
    protected $guarded = [];
}
