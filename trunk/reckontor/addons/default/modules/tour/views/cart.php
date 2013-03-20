<div class="mlm line">
	<div class="main-title-bar">
		<div class="inner overlay">
			<div class="mhl inverse-txt">
				<h1 class="man strong ptl">Your Shopping Cart</h1>					
				<div class="line">
					<div class="unit size1of2">
						<p class="mhn mbn mts xlarge">You have <?php echo $booking_count;?> items in your shopping cart.</p>
						<p class="man xlarge pbl">Total Price for <?php echo $traveler_count;?> Travelers: USD $<?php echo $total_fee;?></p>
					</div>					
				</div>                    
			</div>                
			<div class="hd product-price inverse-txt txtR">
				<span class="price-from">Current cart total</span>
				<span>USD</span>
				<span class="price-amount price-amount-m"><span class="currency-sign">$</span><?php echo $total_fee;?></span>
			</div>
		</div>
	</div>
	<div class="main-content">
		<div class="omniture">

		</div><!-- End of Omniture Code-->

		<form enctype="" name="shop-cart" id="shop-cart" method="get" action="{{url:site uri='tour/checkout'}}" class="clearfix">
		    
			<p><a class="inverse-link large strong" href="javascript:;"><i class="icon icon-arrow-west unit mts"></i>Continue Shopping</a></p>
			<?php foreach ($booking_details as $i => $booking_detail) { ?>
			
			<div class="line main-border-t cart-row">
				<div class="unit size3of5">
			        <h2 class="product-title mtn ptm">
			            <a class="inverse-link" rel="nofollow" href="javascript:;"><?php echo $booking_detail->tour->title;?></a>
			        </h2>
					<div class="media man product-summary">
						<?php if(isset($booking_detail->tour->tour_photo)) {?>
						<div class="img pbm">
							<div class="img-product">
									<a class="img-link no-hover" rel="nofollow" href="javascript:;">
										<img width="154" height="109"  src="<?php echo $booking_detail->tour->tour_photo->photo_path;?>">
									</a>
							</div>
						</div>
						<?php }?>
						<div class="bd">
							<ul class="mtn">
								<li><span class="strong">Travel date:&nbsp;</span><?php echo $booking_detail->day . ' ' . $booking_detail->monthyear;?></li>
								<li><span class="strong">Number of adults:</span>&nbsp;<?php echo $booking_detail->adult_count;?></li>
								<li><span class="strong">Booking status</span>:&nbsp; ???</li>
								<li class="note">Confirmation of this activity will take up to 48 hours, depending on availability<p></p></li>
							</ul>
						</div>
					</div>
				</div>

				<div class="unit size1of5">
					<ul class="mhn">
						<li><a class="inverse-link" rel="nofollow" href="javascript:;"><i class="icon icon-arrow-link unit mts"></i>Change dates &amp; details</a></li>
						<li><a class="inverse-link" href="javascript:;"><i class="icon icon-cross unit mts"></i>Remove from cart</a></li>
					</ul>
				</div>
				<div class="unit size1of5">
					<p class="txtR strong h2 mln">USD $<?php echo $booking_detail->total_fee;?></p>
				</div>

			</div><!-- end of cart-row -->
			<?php }?>
			<div class="line main-border-t">
				<div class="unitRight size1of2">
					<div class="line">						
						<div class="mod basic mrn mbn unitRight size2of3">
							<b class="top"><b class="tl"></b><b class="tr"></b></b>
							<b class="bottom"><b class="bl"></b><b class="br"></b></b>                                    
						</div>
					</div>
					<div class="line">
						<div class="txtR mtm mrm">
							<span class="price-from">Current cart total</span>
							<span>USD</span>
							<span class="price-amount price-amount-m"><span class="currency-sign">$</span><?php echo $total_fee;?><span></span></span>
							<div class="btn btn-booking unitRight size-btn-booking-proceed-to-checkout mbl mts"><button  type="submit" name="checkout"><span>Proceed to Checkout</span></button></div>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
</div>
