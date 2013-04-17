<div class="mlm line">
	<div class="main-title-bar">
		<div class="inner tall overlay">
			<div class="mhl inverse-txt">
				<h1 class="man strong ptl">
					Search results for '<?php echo $keyword;?>':
				</h1>
				<p class="man strong info-label h6">Total Results: <?php echo $search_count;?> Results Found</p>
				<?php if($search_count>0 && ($search_count-$tour_count>0)){?>
				<div class="pbl">
					<div class="pbl">
						<p class="mbn mhn strong">Destination matches</p>

						<ul class="mts number">
							<?php foreach ($country_destinations as $destination) {?>
							<li><a
								title="<?php echo $destination->country_name;?>" 
								href="{{ url:site uri='tour/search' }}/1/<?php echo $destination->country_id;?>"><b><?php echo $destination->country_name;?></b> </a>
							</li>
							<?php }?>
							<?php foreach ($city_destinations as $destination) {?>
							<li><a
								title="<?php echo $destination->country_name;?>" 
								href="{{ url:site uri='tour/search' }}/1/<?php echo $destination->country_id;?>"><b><?php echo $destination->country_name;?></b> </a> ,
								<a
								title="<?php echo $destination->city_name;?>" 
								href="{{ url:site uri='tour/search' }}/1/<?php echo $destination->country_id;?>/<?php echo $destination->city_id;?>"><b><?php echo $destination->city_name;?></b> </a>
							</li>
							<?php }?>
						</ul>

					</div>
				</div>
				<?php }?>
			</div>
		</div>
	</div>
	<div class="main-content">
		<div class="main-col">
			<h1 class="strong h2 mbn mtl">Tour &amp; Activity Matches (<?php echo $tour_count;?>
				Results)</h1>
			<?php if($search_count==0){?>
			<div class="media mhn simple-border">
				{{ theme:image file="exclamation_bubble.png" class="img mam" }}
				<div class="bd">
					<p class="h3 strong mbs">No results found! (That's a bummer)</p>
					<p class="mts">
						Your search for <strong>"<?php echo $keyword;?>"</strong>
						did not return any results. Here are some suggestions to improve your
						search results:
					</p>
					<ul class="simple-list">
						<li>Make sure all words are spelled correctly;</li>
						<li>Try different and/or more general keywords;</li>
						<li>Remove common words such as "the", "and", "or".</li>
					</ul>
				</div>
			</div>
			<?php } else {?>
			<div class="line main-border-t main-shader small">
				<div class="unit size1of3">
					<p class="mvs mrn">
						<span class="strong">Results</span>
						<?php echo $page_nav['start_record'];?>
						-
						<?php echo $page_nav['end_record'];?>
						of
						<?php echo $page_nav['record_count'];?>
					</p>
				</div>
				<div class="unit size2of3">
					<p class="txtR mvs mln">
						<span class="strong">Page</span>
						<?php
						$i=$page_nav['page_start'];
						while($i<=$page_nav['page_end']){
							if($i==$page_nav['page']){
								?>
						<span class="basic-pipe">|</span> <span class="strong"><?php echo $i;?>
						</span>
						<?php
							}else {?>
						<span class="basic-pipe">|</span> <a class="inverse-link"
							href="{{ url:site uri='tour/search_keyword' }}/<?php echo $i;?>/<?php echo $keyword;?>"><?php echo $i;?>
						</a>
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
				<h2 class="product-title mtn ptm">
					<a class="inverse-link"
						href="{{ url:site uri='tour/detail' }}/<?php echo $tour->tour_id;?>"><?php echo $tour->title;?>
					</a>
				</h2>
				<div class="media man product-summary">
					<div class="img pbm">
						<div class="img-product overlay">
							<a class="img-link no-hover"
								href="{{ url:site uri='tour/detail' }}/<?php echo $tour->tour_id;?>">
								{{ theme:image file="<?php echo $tour->photo_path;?>" alt="" }}
							</a>
						</div>
					</div>
					<div class="bd">
						<div class="line">
							<div class="unit size3of5">
								<p class="mvn mrn">
								<?php echo $tour->introduction;?>
									<br> <a class="inverse-link"
										href="{{ url:site uri='tour/detail' }}/<?php echo $tour->tour_id;?>"><i
										class="icon icon-arrow-link unit mts"></i>Read more</a>
								</p>
							</div>
							<div class="unit size1of2">
								<ul class="xsmall note mrn mts">
									<li>
										<div class="media man">
											<i title="Location" class="icon icon-location img"></i>
											<div class="bd">
											<?php echo $tour->city_name;?>
												,
												<?php echo $tour->country_name;?>
											</div>
										</div>
									</li>
									<li>
										<div class="media man">
											<i title="Duration" class="icon icon-clock img"></i>
											<div class="bd">
											<?php echo $tour->duration_hours;?>
											</div>
										</div>
									</li>
								</ul>
							</div>

							<div class="product-price txtR line">
								<span class="price-from">From USD</span> <span
									class="price-amount"><span class="currency-sign">$</span> <?php echo $tour->common_adult_price;?><span></span>
								</span>
								<div class="btn btn-alt unitRight size-btn-check-dates mts">
									<button title="Check Dates">
										<span>Check Dates</span>
									</button>
								</div>
							</div>

						</div>
					</div>
					<!-- end bd -->
				</div>
			</div>
			<?php }?>
			<div class="line main-border-t main-border-b main-shader small">
				<div class="unit size1of3">
					<p class="mvs mrn">
						<span class="strong">Results</span>
						<?php echo $page_nav['start_record'];?>
						-
						<?php echo $page_nav['end_record'];?>
						of
						<?php echo $page_nav['record_count'];?>
					</p>
				</div>
				<div class="unit size2of3">
					<p class="txtR mvs mln">
						<span class="strong">Page</span>
						<?php
						$i=$page_nav['page_start'];
						while($i<=$page_nav['page_end']){
							if($i==$page_nav['page']){
								?>
						<span class="basic-pipe">|</span> <span class="strong"><?php echo $i;?>
						</span>
						<?php
							}else {?>
						<span class="basic-pipe">|</span> <a class="inverse-link"
							href="{{ url:site uri='tour/search_keyword' }}/<?php echo $i;?>/<?php echo $keyword;?>"><?php echo $i;?>
						</a>
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
					<a
						href="{{ url:site uri='tour/search_keyword' }}/<?php echo $page_nav['next_page'];?>/<?php echo $keyword;?>">NEXT
						PAGE</a>
				</div>
				<?php }?>
			</div>
			<?php }?>
		</div>
		<div class="right-col">
			<div position="1" layoutcode="TAN" mmid="4700" id="mm_4700">
				<div class="mod simple mhn">
					<b class="top"><b class="tl"></b><b class="tr"></b> </b>
					<div class="inner">
						<div class="hd">
							<div class="txtC info-label hint xxsmall mts">Advertisement</div>
						</div>
						<div class="bd pbm pts">
							<div class="txtC imgC">
								<script
									src="http://www.traveladvertising.com/Live/SearchAdx.js?PlacementId=57547&DestAp=HAN"
									language="javascript" type="text/javascript"></script>
							</div>
						</div>
					</div>
					<b class="bottom"><b class="bl"></b><b class="br"></b> </b>
				</div>
			</div>


			<script src="http://psf.pointroll.com/pointroll/script/psf.js"
				type="text/javascript"></script>
		</div>
		<!-- end right-col -->
	</div>
</div>
