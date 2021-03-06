<?php

namespace App\Http\Controllers;
use App\Member;
use App\Customer;
use App\Product;
use App\Product_Type;
use App\Cart;
use App\Orders;
use App\Order_Detail;
use Session;
use Hash;
use Auth;

use Illuminate\Http\Request;

class PageController extends Controller
{
    public function getTrangchu(){

		$member = Member::where('id',1)->first();	
		$new_product = Product::where('id','<>',0)->paginate(8);
		return view('trangchu',['new_product'=>$new_product]);
	}
	public function getLoaigiay($type){

        $gettheo_Loaisp = Product::where('id_type',$type)->get();
        $sp_khac = Product::orderBy('promotion_price', 'desc')->paginate(3);
        $loai=Product_Type::all();
        $loai_sp=Product_Type::where('id',$type)->first();
        return view('loaigiay',['gettheo_Loaisp'=>$gettheo_Loaisp,
                                'sp_khac'=>$sp_khac,
                                'loai'=>$loai,
                                'loai_sp'=>$loai_sp]);
	} 
	public function getChitietsp($type){
        $sanpham=Product::where('id',$type)->first();
        return view('chitietsanpham',['sanpham'=>$sanpham]);
    }

    public function getAddtocart(Request $req,$id){
        $product=Product::find($id);
        $oldcart=Session('cart')?Session::get('cart'):null;
        $cart = new Cart($oldcart);
        $cart->add($product,$id);
        $req->Session()->put('cart',$cart);
        return redirect()->back();

     }
     public function getDeletecart($id){
        $oldcart=Session::has('cart')?Session::get('cart'):null;
         $cart= new Cart($oldcart);
         $cart->removeItem($id);
         if(count($cart->items)>0){
             Session::put('cart',$cart);
         }
         else{
            Session::forget('cart');
        }
         return redirect()->back();

    }
    public function getDathang(){
        if(!Session::has('cart'))
            return redirect('trangchu');
        else
             return view('dathang');
    }
    public function getDangky(){
        return view('dangky');
    }
     public function getDangnhap(){
        return view('dangnhap');
    }
    public function getDangxuat(){
        Session::forget('dangnhap');
        return redirect('dangnhap');
    } 
     public function getTimkiem(Request $req){
        $products = Product::where('name','like','%'.$req->key.'%')
                            ->orWhere('unit_price','like','%'.$req->key.'%')->get();
        return view('timkiem',compact('products'));
    }  
 

    public function postDangnhap(Request $request){
        $email = $request['email'];
        $password = $request['password'];
        $mem = Member::where('email',$email )->first();
        if($mem != null && $mem->matkhau == $password){
            Session::put('dangnhap',$mem);
            $login = Session::get('dangnhap');
            // return view('trangchu'); //error
             return redirect('trangchu');
            //return $this->getTrangchu();
        }
        else 
            return redirect()->back()->with('error','Đăng nhập không thành công');
    //            return view('dangnhap',['error'=>'Đăng nhập không thành công']);
    }
    public function postDangky(Request $req){
        // $this->validate($req,
        // [
        // 'email' => 'required|email|unique:member,email',
        // 'pass'  => 'required|min:6|max:20',
        // 'hoten' => 'required',
        // 'pass2' => 'required|same:pass1'
        // ],
        // [
        // 'email.required' => 'Vui lòng nhập Email',
        // 'email.email' => 'Không đúng định dạng email',
        // 'email.unique' => 'Email đã có người sử dụng',
        // 'pass1.required' => 'Vui lòng nhập mật khẩu',
        // 'pass1.same' => 'Mật khẩu không giống nhau',
        // 'pass1.min'=> ' Mật khẩu ít nhất 6 kí tự'
        // ]);
        $member = new Member();
        $member->member_name = $req->hoten;
        $member->email = $req->email;
        $member->cmnd = $req->cmnd;
        $member->address = $req->diachi;
        $member->phone_number = $req->sdt;
        $member->matkhau = $req->pass1;
        $member->save();
        return view('thanhcong',['thongbao'=>'Bạn đã có tài khoản vui lòng đăng nhập để mua hàng.']);
    }    
    //Customer đặt hàng
public function postDathang(Request $req){
            $cart=Session::get('cart');
            //dd($cart); exit();
            $customer = new Customer;
            $customer->customer_name = $req->name;
            $customer->gender= $req->gender;
            $customer->email=$req->email;
            $customer->address=$req->address;
            $customer->phone_number=$req->phone;
            $customer->save();

            $order = new Orders;
            $i=rand(1000,10000);
            $order->madonhang= $i;
            $order->id_customer = $customer->id;
            $order->date_order = date('Y-m-d');
            $order->total = $cart->totalPrice;
            $order->payment=$req->payment;
            $order->save();

            foreach ($cart->items as $key => $value) {
            $order_detail= new Order_Detail;
            $order_detail->id_order=$order->id;
            $order_detail->id_product = $key;
            $order_detail->Soluong = $value['qty'];
            $order_detail->unit_price=$value['price']/$value['qty'];
            $order_detail->save();
            }
            Session::forget('cart');
            return view('thanhcong',['message'=>'Bạn đã đặt hàng thành công đơn hàng : ','code'=>$i]);
     } 
     // Member đặt hàng
     public function postDathang1(Request $req){
            $cart=Session::get('cart');
            $i=rand(1000,10000);
            $order = new Orders;
            $order->madonhang= $i;
            $order->id_member = Session::get('dangnhap')->id;
            $order->date_order = date('Y-m-d');
            $order->total = $cart->totalPrice;
            $order->payment=$req->payment;
            $order->save();

            foreach ($cart->items as $key => $value) {
            $order_detail= new Order_Detail;
            $order_detail->id_order=$order->id;
            $order_detail->id_product =  $value['item']['id'];
            $order_detail->Soluong = $value['qty'];
            $order_detail->unit_price=$value['price']/$value['qty'];
            $order_detail->save();
            }
            Session::forget('cart');
            return view('thanhcong',['message'=>'Don hang da xu ly','code'=>$i]);
     } 
   
    // Xóa đơn hàng
    public function getDeleteOrder(Request $req,$id){
        $del = Orders::where('id',$id)->delete();
        //$req->Session()->put('orders',$del);
        return redirect()->back();
    }
    public function getTracuu(){
        if(Session::has('dangnhap')){
         Session::forget('orders'); // Load lại session
         $orders = Orders::where('id_member',Session::get('dangnhap')->id)->get();
         Session::put('orders',$orders);
     }
         return view('tracuu');

    }
    public function postTracuu(Request $req){
        $email = $req['email'];
        $code = $req['code'];
        if(!Session::has('dangnhap')){
        $orders_detail= Customer::Where('email',$email)
                        ->join('Orders','id_customer','=','Customer.id')
                        ->join('Order_Detail', function ($join) use ($code) {
                              $join->on ('Order_Detail.id_order','=','Orders.id')
                             ->where('Orders.madonhang', '=',$code);})
                        ->join('Products','Products.id','=','Order_Detail.id_product')
                        ->select('Customer.email','Order_Detail.id','customer_name','Products.name','Soluong','Order_Detail.unit_price','id_product','id_order','total','madonhang','date_order')
                        ->get();   
                         }
        else{
            // Lọc ra chi tiết đơn hàng theo đia chỉ Email + code
            $orders_detail= Member::Where('email',Session::get('dangnhap')->email)
                        ->join('Orders','id_member','=','Member.id')
                        ->join('Order_Detail', function ($join) use ($code) {
                              $join->on ('Order_Detail.id_order','=','Orders.id')
                             ->where('Orders.madonhang', '=',$code);})
                        ->join('Products','Products.id','=','Order_Detail.id_product')
                        ->select('Order_Detail.id','member_name','Products.name','Soluong','Order_Detail.unit_price','id_product','id_order','total','madonhang','date_order')
                        ->get();
            // Lưu danh sách đơn hàng
           
        }
         
        $orders_detail = $orders_detail->values();
        //dd($orders->get(0));
        //dd($orders->isEmpty());
        if($orders_detail->get(0) != null){ // Nếu tồn tại đơn hàng
            Session::put('tracuu',$orders_detail);      
            //$tracuu = Session::get('tracuu');
            return redirect()->back();
        }
        else
            return redirect()->back()->with('tracuufail','Email hoặc mã đơn hàng của bạn không hợp lệ');
    }

    


    public function login(Request $request)
    {
    $email = $request['email'];
    $password = $request['password'];
    if(Auth::attempt(['email'=>$email,'matkhau'=>$password]))
        return view('thanhcong',['error'=>'Dang nhap thanh cong']);
    else
        return view('thanhcong',['error'=>'Dang nhap khong thanh cong']);

    }


    public function getKhuyenmai(){
        $khuyenmai_sp = Product::where('promotion_price',"<>",0)->get();   
        return view('khuyenmai',['khuyenmai_sp'=>$khuyenmai_sp]);

    }
     public function postprofile(Request $req){
        $postprofile = Member::Where('id',Session('dangnhap')->id)->update(['member_name'=>$req->hoten,
                                                                        'phone_number'=>$req->sdt,
                                                                        'cmnd'=>$req->cmnd,
                                                                        'address'=>$req->diachi]);
         $bidder = Member::where('id',Session('dangnhap')->id)->first();
         Session::put('dangnhap',$bidder); 
         return redirect()->back();

    }
}
