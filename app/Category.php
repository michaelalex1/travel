<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    //protected $table ='tabla';
    protected $fillable=['name','description','state'];

    public function scopeName($query, $name)
    {
        if($name)
        {
            return $query->where('name','like',"%" . $name. "%");
        }
    }
}
