<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
     
    protected $fillable=['description','codigo','stock','img','price_compra','price_venta','date'];

}
