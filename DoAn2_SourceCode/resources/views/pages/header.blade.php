<!doctype html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Laravel </title>
	<link href='http://fonts.googleapis.com/css?family=Dosis:300,400' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
	<!-- <link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css"> -->
	<link rel="stylesheet" href="../css/bootstrap.min.css">
	<link rel="stylesheet" href="../assets/dest/css/font-awesome.min.css">
	<link rel="stylesheet" href="../assets/dest/vendors/colorbox/example3/colorbox.css">
	<link rel="stylesheet" href="../assets/dest/rs-plugin/css/settings.css">
	<link rel="stylesheet" href="../assets/dest/rs-plugin/css/responsive.css">
	<link rel="stylesheet" title="style" href="../assets/dest/css/style.css">
	<link rel="stylesheet" href="../assets/dest/css/animate.css">
	<link rel="stylesheet" title="style" href="../assets/dest/css/huong-style.css">
</head>
<body >
	<style type="text/css">
		*{
			font-family:Helvetica, sans-serif;   
		}
	</style>
	<div id="header">
		<div class="header-top">
			<div class="container">
				<div class="pull-left auto-width-left">
				</div>
				<div class="pull-right auto-width-right">
					<ul class="top-details menu-beta l-inline">
						@if(Session::has('dangnhap'))
							<li><a href="/profile">Tài khoản của {{Session('dangnhap')->member_name}}</a></li>
							<li><a href="/dangxuat">Đăng xuất</a></li>
						@else
							<li><a href="/dangky">Đăng kí</a></li>
							<li><a href="/dangnhap">Đăng nhập</a></li>
						@endif
							<li><a href="/kiem-tra-don-hang">Tra cứu đơn hàng</a></li>
						@if(Session::has('dangnhap') && Session('dangnhap')->state == 1)
							<li><a href="/admin-order">Quản lý đơn hàng</a></li>
							<li><a href="/admin-account">Quản lý tài khoản</a></li>
						@endif
						
					</ul>
				</div>
			</div> <!-- .container -->
		</div> <!-- .header-top -->
		<div class="header-body">
			<div class="container beta-relative">
				<div class="pull-left">
					<a href="#" id="logo"><img src="../assets/dest/images/logo1.png" style="width: 450px; height: 180px" alt=""></a>					
				</div>
				<div class="pull-right beta-components space-left ov">
					<div class="space10">&nbsp;</div>
					<div class="beta-comp">
						<form action="{{Route('timkiem')}}" method="get" id="searchform" action="/">
					        <input type="text" value="" name="key" id="s" placeholder="Nhập từ khóa..." />
					        <button class="fa fa-search" type="submit" id="searchsubmit" ></button>
						</form>
					</div>

					<div class="beta-comp">
					@if(Session::has('cart'))
						<div class="cart">
							<div class="beta-select" id="checkBox"><i class="fa fa-shopping-cart" id="checkBox"></i>
							 Giỏ hàng @if(Session::has('cart')) ({{Session('cart')->totalQty}}) @else Trống @endif 
							  <i class="fa fa-chevron-down"></i></div>
							
							<div class="beta-dropdown cart-body" id="showcart">
							   @foreach($product_cart as $product)
								<div class="cart-item">
								<a class="cart-item-delete" href="{{route('xoagiohang',$product['item']['id'])}}"> <i class="fa fa-times"></i> </a>
									<div class="media">
										<a class="pull-left" href="#"><img src="../image/product/{{$product['item']['image']}}"  alt="" ></a>
										<div class="media-body">
											<span class="cart-item-title">{{$product['item']['name']}}</span>
											<span class="cart-item-amount">{{$product['qty']}}*<span>@if($product['item']['promotion_price']>0){{number_format($product['item']['promotion_price'])}}@else
											{{number_format($product['item']['unit_price'])}} @endif VND </span></span>
										</div>
									</div>
								</div>
								@endforeach
														
								<div class="cart-caption">
									<div class="cart-total text-right">Tổng tiền: <span class="cart-total-value">{{number_format(Session('cart')->totalPrice)}} VND</span></div>
									<div class="clearfix"></div>

									<div class="center">
										<div class="space10">&nbsp;</div>
										<a href="{{route('dathang')}}" class="beta-btn primary text-center">Đặt hàng <i class="fa fa-chevron-right"></i></a>
									</div>
								</div>
							</div>
						</div> <!-- .cart -->
						@endif
					</div>
				</div>
				<div class="clearfix"></div>
			</div> <!-- .container -->
		</div> <!-- .header-body -->
		<div class="header-bottom" style="background-color: #40ad47;">
			<div class="container">
				<a class="visible-xs beta-menu-toggle pull-right" href="#"><span class='beta-menu-toggle-text'>Menu</span> <i class="fa fa-bars"></i></a>
				<div class="visible-xs clearfix"></div>
				<nav class="main-menu">
					<ul class="l-inline ov">
						<li><a href="/trangchu">Trang chủ</a></li>
						<li><a href="#">Loại giày</a>
							<ul class="sub-menu">
							@foreach($loai_sp as $loai)
							<li><a href="{{ route('loaigiay',$loai->id)}}">{{$loai->name}}</a></li>
							@endforeach
							</ul>
						</li>
						<li><a href="/khuyenmai">Khuyến mãi</a></li>
						<li><a href="/banchay">Bán chạy</a></li>
					</ul>
					<div class="clearfix"></div>
				</nav>
			</div> <!-- .container -->
		</div> <!-- .header-bottom -->
	</div> <!-- #header -->
	<script>
		const showcart = document.querySelector('#showcart');
		const checkBox = document.querySelector('#checkBox');
		checkBox.onclick = () =>{
			if(showcart.style.display=='block')
				showcart.style.display='none';
			else 	
				showcart.style.display='block';
		}
		showcart.onmouseover = () =>{
			showcart.style.display='block';
		}
		showcart.onmouseleave = () =>{
			showcart.style.display='none';
		}
	</script>