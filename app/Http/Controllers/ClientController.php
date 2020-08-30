<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Client;

class ClientController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function __construct()
    {
        $this->middleware('auth');
    }
    public function index(Request $request)
    {
          
        if($request->ajax())
        {
            
        //  return $request['filters'];
        
        $data=json_decode($request['queryParams'], true);
        $filtros=$data['filters'];
        if(count($filtros)==0)
        {
            
                $data = Client::select('id','name','dni','email','phone','direction','birth_date','total_purchases')->orderBy('id', 'desc')->where('name', 'like', '%' .$data['global_search']. '%')
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
    
    public function buscar($buscar)
    {
              $data = Client::select('id','name')->orderBy('id', 'desc')->where('name', 'like', '%' .$buscar. '%')
                     ->get();    
              return response()->json($data);
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
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
        
        $data             = new Client;

        $data->name       =$request->name;
        $data->dni        =$request->dni;
        $data->email      =$request->email;
        $data->phone      =$request->phone;
        $data->direction  =$request->direction;
        $data->birth_date  =$request->birth_date;
        $data->total_purchases   =$request->total_purchases;
        $data->save();
    }

    /**
     * Display the specified resource.
     *P
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
        $data           =Client::findOrFail($request->id);
        $data->name       =$request->name;
        $data->dni        =$request->dni;
        $data->email      =$request->email;
        $data->phone      =$request->phone;
        $data->direction  =$request->direction;
        $data->birth_date  =$request->birth_date;
        $data->total_purchases   =$request->total_purchases;
        $data->save();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $data = Client::find($id);
        $data->delete($id);
    }
    public function vendedor()
    {
       $name=auth()->user()->name;
       
       return response()->json($name);

    }
}
