		        <div id="SSProdSearchDiv">
					<h1 class="strong mbs h2">All <?php echo $page_nav['record_count'];?> things to do in <?php echo $location_info->name;?></h1>
	                <p>The top <?php echo $location_info->name;?> tours and things to do in <?php echo $location_info->name;?>.</p>
	                <div class="line main-border-t main-shader small">
						<div class="unit size1of3">
							<p class="mvs mrn"><span class="strong">Results</span> <?php echo $page_nav['start_record'];?>-<?php echo $page_nav['end_record'];?> of <?php echo $page_nav['record_count'];?></p>
						</div>
						<div class="unit size2of3">
							<p class="txtR mvs mln"><span class="strong">Page</span>
								<?php 
								$i=$page_nav['page_start'];
								while($i<=$page_nav['page_end']){
									if($i==$page_nav['page']){
								?>
								<span class="basic-pipe">|</span> <span class="strong"><?php echo $i;?></span>
								<?php 
									}else {?>
								<span class="basic-pipe">|</span> <a class="inverse-link" href="{{ url:site uri='tour/search' }}/<?php echo $i;?>/<?php echo $country_id;?>"><?php echo $i;?></a>
								<?php 
									}
									$i++;
								}
								?>
							</p>
						</div>
					</div>
			        <?php foreach ($tours as $tour) {?>
			        <div class="main-border-t">
			            <h2 class="product-title mtn ptm"><a class="inverse-link" href="{{ url:site uri='tour/detail' }}/<?php echo $tour->tour_id;?>"><?php echo $tour->title;?></a></h2>
			            <div class="media man product-summary">
			                <div class="img pbm">
			                	<div class="img-product overlay">
									<a class="img-link no-hover" href="{{ url:site uri='tour/detail' }}/<?php echo $tour->tour_id;?>">
										<img src="{{ url:site uri='files/thumb' }}/<?php echo $tour->photo_id;?>/154/109/fit"/>
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
													<div class="bd"><?php echo $tour->duration;?></div>
												</div>
											</li>
										</ul>
									</div>
									
									<div class="product-price txtR line">
										<span class="price-from">From USD</span>
										<span class="price-amount"><span class="currency-sign">$</span><?php echo $tour->common_adult_price;?><span></span></span>
										<div class="btn btn-alt unitRight size-btn-check-dates mts">
											<button title="Check Dates"><span>Check Dates</span></button>
										</div>
									</div>
			
								</div>									
							</div><!-- end bd -->
						</div>
					</div>
					<?php }?>
					<div class="line main-border-t main-border-b main-shader small">
						<div class="unit size1of3">
							<p class="mvs mrn"><span class="strong">Results</span> <?php echo $page_nav['start_record'];?>-<?php echo $page_nav['end_record'];?> of <?php echo $page_nav['record_count'];?></p>
						</div>
						<div class="unit size2of3">
							<p class="txtR mvs mln"><span class="strong">Page</span>
								<?php 
								$i=$page_nav['page_start'];
								while($i<=$page_nav['page_end']){
									if($i==$page_nav['page']){
								?>
								<span class="basic-pipe">|</span> <span class="strong"><?php echo $i;?></span>
								<?php 
									}else {?>
								<span class="basic-pipe">|</span> <a class="inverse-link" href="{{ url:site uri='tour/search' }}/<?php echo $i;?>/<?php echo $country_id;?>"><?php echo $i;?></a>
								<?php 
									}
									$i++;
								}
								?>
							</p>
						</div>
					</div>
					<div class="line no-print">
						<?php 						
						if ($page_nav['next_page']>0){
						?>
						<div class="next_page">
							<a href="{{ url:site uri='tour/search' }}/<?php echo $page_nav['next_page'];?>/<?php echo $country_id;?>">NEXT PAGE</a>
						</div>
						<?php }?>
					</div>
		        </div>
