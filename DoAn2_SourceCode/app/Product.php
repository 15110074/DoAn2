<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    //
        protected $table = "products";
        public function product_type(){
			return $this->belongsTo('App\ProductType','id_type','id');
		}
		public function order_detail(){
			return $this->hasMany('App\Order_Detail','id_product','id');
		}

}
