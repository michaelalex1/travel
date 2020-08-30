<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\Image;
use Illuminate\Support\Facades\Input;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str as Str; 
class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
     public function index(Request $request)
    {
        
        if($request->ajax()){
            
            $data=Product::select('categories.name','products.img','products.id','categories.id as category_id','products.description','products.codigo','products.stock','products.price_compra','products.price_venta','products.date','categories.parent_id')
                ->join('categories', 'products.category_id', '=', 'categories.id')
                ->orderBy('id', 'desc')->get();


            return response()->json($data);

        }else{
            return view('home');
        }

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function list(Request $request)
    {
        if($request->ajax())
        {
            
      
        $data=json_decode($request['queryParams'], true);
        $filtros=$data['filters'];
        if(count($filtros)==0)
        {
            
                $data = Product::select('products.id','products.description','products.codigo','products.stock','products.img','products.price_venta','categories.name as categoria')
                                    ->join('categories', 'categories.id', '=', 'products.category_id')
                                     ->orderBy('categories.id', 'desc')
                                     ->where('products.description', 'like', '%' .$data['global_search']. '%')
                                     ->paginate($request['per_page']);    
            
                return response()->json($data);
        }else{
                $name='';
                $dni='';
              

                foreach ($filtros as $value)
                 {
                           if($value['name']=='name')
                           {
                            $name=$value['text'];
                           }
                           if($value['name']=='dni')
                           {
                            $dni=$value['text'];
                           }
                 }
                   
                    $data=Client::name($name)->dni($dni)->paginate($request['per_page']);
                    return response()->json($data);
        }
        
        }else{
            return view('home');
        }

    }

    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
     public function store(Request $request)
    {
         
         $file = $request->file('img');

         $nombre ='/producto/'.time()."_".$file->getClientOriginalName();
         Storage::disk('public')->put($nombre,  \File::get($file));

         $data              = new Product;
         $data->description = $request->description;
         $data->codigo      = $request->codigo;
         $data->stock       = $request->stock;
         $data->price_compra= $request->price_compra;
         $data->price_venta = $request->price_venta;
         $data->date        = $request->date;
         $data->category_id = $request->parent_id;
         $data->img = $nombre;
         $data->save();

         return response()->json([
            'data' => $data,
            'message' => 'Success'
         ], 200); 


    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request)
    {
         if($request->file('img'))
         {

             $file = $request->file('img');

             $nombre ='/producto/'.time()."_".$file->getClientOriginalName();
             Storage::disk('public')->put($nombre,  \File::get($file));

             $data              =Product::findOrFail($request->id);
             $data->description = $request->description;
             $data->codigo      = $request->codigo;
             $data->stock       = $request->stock;
             $data->price_compra= $request->price_compra;
             $data->price_venta = $request->price_venta;
             $data->date        = $request->date;
             $data->category_id = $request->parent_id;
             $data->img = $nombre;
             $data->save();

        }else
        {
             $data              =Product::findOrFail($request->id);
             $data->description = $request->description;
             $data->codigo      = $request->codigo;
             $data->stock       = $request->stock;
             $data->price_compra= $request->price_compra;
             $data->price_venta = $request->price_venta;
             $data->date        = $request->date;
             $data->category_id = $request->parent_id;
             $data->save(); 
        }

    }


    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Product::find($id);
        $data->delete($id);
    }
    public function galery(Request $request)
    {
       
        $file = $request->file('file');

         $nombre ='/galeria_producto/'.time()."_".$request->file->getClientOriginalName();
         Storage::disk('public')->put($nombre,  \File::get($file));

         $data              = new Image;
         $data->img         = $nombre;
         $data->product_id  = $request->product_id;
         $data->save();


    }
    public function galeryListar($id)
    {
       
        $data=Image::where('product_id','=', $id)->orderBy('id', 'desc')->get();

        return response()->json($data);

    }

    public function galeryListarDelete($id)
    {
        $data = Image::find($id);
        $data->delete($id);

    }

    
    
}
