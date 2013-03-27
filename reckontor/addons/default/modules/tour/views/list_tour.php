		        <div id="SSProdSearchDiv">
					<h1 class="strong mbs h2">All <?php echo $tour_count;?> things to do in <?php echo $country_info->country_name;?></h1>
	                <p>The top <?php echo $country_info->country_name;?> tours and things to do in <?php echo $country_info->country_name;?>.</p>
			        <?php foreach ($tours as $tour) {?>
			        <div class="main-border-t">
			            <h2 class="product-title mtn ptm"><a class="inverse-link" href="{{ url:site uri='tour/detail' }}/<?php echo $tour->tour_id;?>"><?php echo $tour->title;?></a></h2>
			            <p class="mtn">
							<a class="no-hover" onclick="return false;" href="#"><i class="icon icon-wishlist"></i></a><a class="inverse-link" onclick="return false;" href="#">Add to Wishlist</a>
						</p>
			            <div class="media man product-summary">
			                <div class="img pbm">
			                	<div class="img-product overlay">
									<a class="img-link no-hover" title="3-Day Tour from Sabah: Sandakan Sightseeing and Wildlife Experience in Sepilok and Selingan, Kota&nbsp;...&nbsp;" href="/tours/Kota-Kinabalu/3-Day-Tour-from-Sabah-Sandakan-Sightseeing-and-Wildlife-Experience-in-Sepilok-and-Selingan/d4171-3705KK60">
										<img width="154" height="109" alt="3-Day Tour from Sabah: Sandakan Sightseeing and Wildlife Experience in Sepilok and Selingan, Kota&nbsp;...&nbsp;" src="http://cache.graphicslib.viator.com/graphicslib/thumbs154x109/3705/SITours/3-day-tour-from-sabah-sandakan-sightseeing-and-wildlife-experience-in-in-sabah-119790.jpg">
									</a>
			                    </div>
			                </div>
							<div class="bd">
								<div class="line">
									<div class="unit size3of5">
										<p class="mvn mrn"><?php echo $tour->introduction;?><br>
										<a class="inverse-link" href="{{ url:site uri='tour/detail' }}/<?php echo $tour->tour_id;?>"><i class="icon icon-arrow-link unit mts"></i>Read more</a></p>
									</div>
									<div class="unit size1of2">
										<ul class="xsmall note mrn mts">
											<li>
												<div class="media man">
													<i title="Location" class="icon icon-location img"></i>
													<div class="bd">
															<?php echo $tour->city_name;?>, <?php echo $tour->country_name;?>
													</div>
												</div>
											</li>
											<li>
												<div class="media man">
													<i title="Duration" class="icon icon-clock img"></i>
													<div class="bd"><?php echo $tour->duration_hours;?></div>
												</div>
											</li>
										</ul>
									</div>
									
									<div class="product-price txtR line">
										<span class="price-from">From USD</span>
										<span class="price-amount"><span class="currency-sign">$</span><?php echo $tour->common_adult_price;?><span></span></span>
										<div class="btn btn-alt unitRight size-btn-check-dates mts">
											<button onclick="window.location.href='/tours/Kota-Kinabalu/3-Day-Tour-from-Sabah-Sandakan-Sightseeing-and-Wildlife-Experience-in-Sepilok-and-Selingan/d4171-3705KK60';" title="Check Dates"><span>Check Dates</span></button>
										</div>
									</div>
			
								</div>									
							</div><!-- end bd -->
						</div>
					</div>
					<?php }?>
					<div class="line main-border-t main-border-b main-shader small">
						<div class="unit size1of3">
							<p class="mvs mrn"><span class="strong">Results</span> <?php echo ($page-1)*RECORD_PER_PAGE+1;?>-<?php echo count($tours);?> of <?php echo $tour_count;?></p>
						</div>
						<div class="unit size2of3">
							<p class="txtR mvs mln"><span class="strong">Page</span>
								<span class="basic-pipe">|</span> <span class="strong">1</span>
								<span class="basic-pipe">|</span> <a class="inverse-link" href="/Malaysia/d17-ttd?page=2&amp;topx=16-30">2</a>
								<span class="basic-pipe">|</span> <a class="inverse-link" href="/Malaysia/d17-ttd?page=3&amp;topx=31-45">3</a>
								<span class="basic-pipe">|</span> <a class="inverse-link" href="/Malaysia/d17-ttd?page=4&amp;topx=46-60">4</a>
								<span class="basic-pipe">|</span> <a class="inverse-link" href="/Malaysia/d17-ttd?page=5&amp;topx=61-75">5</a>
						 		<span class="basic-pipe">|</span> <a class="inverse-link" href="/Malaysia/d17-ttd?page=2&amp;topx=16-30">Next</a>
							</p>
						</div>
					</div>
					<div class="line no-print">
						<div class="next_page"><button onclick="document.location.href='/Malaysia/d17-ttd?page=2&amp;topx=16-30';" title="next page">next page</button></div>
					</div>
		        </div>
