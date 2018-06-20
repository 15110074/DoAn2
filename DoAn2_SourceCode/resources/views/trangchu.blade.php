
@extends('pages/master')

@section('content')

	<div class="rev-slider">
	<div class="container">
		<div id="content" class="space-top-none">
			<div class="main-content">
				<div class="space60">&nbsp;</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="beta-products-list">
							<h4 >Trang chủ</h4>
							<div class="space50">&nbsp;</div><div class="space50">&nbsp;</div>
							<div class="beta-products-details">
								<p class="pull-left"></p>
									<div class="clearfix"></div>
										</div>
							<div class="row">
								@foreach($new_product as $new)
								<div class="col-sm-3">
									<div class="single-item">
										@if($new->promotion_price != 0)
										 <div class="ribbon-wrapper"><div class="ribbon sale">Sale</div></div>
										@endif
										<div class="single-item-header">
											<a href="{{route('chitietsanpham',$new->id)}}">
												<img src="../image/product/{{$new->image}}" alt=""></a>
										</div>
										<div class="single-item-body">
											<div style="float: left;">
											<p class="single-item-title">{{$new->name}}</p>
											<p class="single-item-price">
											@if($new->promotion_price==0)
												<span class="flash-sale">{{number_format($new->unit_price)}} VND</span>
												@else 
												<span class="flash-del">{{number_format($new->unit_price)}} VND</span><br>
												<span class="flash-sale">{{number_format($new->promotion_price)}} VND</span>
												@endif
											</p>
											</div>
											<div style="float: right">
											<a class="add-to-cart pull-left" href="{{route('themgiohang',$new->id)}}"><i class="fa fa-shopping-cart"></i></a>
											</div>
										</div>
									</div>
								</div>
								@endforeach
								<div class="row"><div style="float:right; margin-right: 500px;">{{$new_product->links()}}</div></div>
								
							</div>
						</div> <!-- .beta-products-list -->

						<div class="space50">&nbsp;</div>

						<!-- <div class="beta-products-list">
							<h4 align="center">Các sản phẩm bán chạy nhất</h4>
							<div class="beta-products-details">
								<p class="pull-left"></p>
								<div class="clearfix"></div>
							</div>
							<div class="row">
								<div class="col-sm-3">
									<div class="single-item">
										<div class="single-item-header">
											<a href="product.html"><img src="assets/dest/images/products/1.jpg" alt=""></a>
										</div>
										<div class="single-item-body">
											<div style="float: left;">
											<p class="single-item-title">Sample Woman Top</p>
											<p class="single-item-price">
												<span>$34.55</span>
											</p>
											</div>
											<div style="float: right;">
											<a class="add-to-cart pull-left" href="shopping_cart.html"><i class="fa fa-shopping-cart"></i></a>
											</div>
										

										</div>
										
									</div>
								</div>
							</div>
					</div> -->
				</div> <!-- end section with sidebar and main content -->


			</div> <!-- .main-content -->
		</div> <!-- #content -->
	</div> <!-- .container -->
</div>
@endsection