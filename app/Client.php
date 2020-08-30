<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Client extends Model
{
    public function scopeName($query, $name)
    {
        if($name)
        {
            return $query->where('name','like',"%" . $name . "%");
        }
    }
    public function scopeDni($query, $dni)
    {
        if($dni)
        {
            return $query->where('dni','like',"%" . $dni . "%");
        }
    }
}
