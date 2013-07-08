<div class="wrap clearfix">
	<!--latest offers-->
	<section class="offers clearfix full">
		<h1>LATEST OFFERS & HIGHLIGHTS</h1>
		<?php 
		$i=0;
		foreach ($latest_tours as $latest_tour) {
			$i++;
		?>		
		<!--column-->
		<article class="one-fourth<?php if($i%4==0) echo " last";?>">
			<figure>
				<a href="#" title="">
				<?php if ($latest_tour->photo_id>0) {?>
					<img src="{{ url:site uri='files/thumb' }}/<?php echo $latest_tour->photo_id;?>/270/152/fit"/>
				<?php } else {?>
					{{ theme:image file="uploads/img.jpg" alt="" }}
				<?php }?>
				</a>
			</figure>
			<div class="details">
				<h4><?php echo $latest_tour->title;?></h4>
				<a href="{{ url:site uri='tour/detail' }}/<?php echo $latest_tour->tour_id;?>" title="More info" class="gradient-button">More info</a>
			</div>
		</article>
		<!--//column-->
		<?php }?>
	</section>
	<!--//latest offers-->
	
	<!--top destinations-->
	<section class="destinations clearfix full">
		<h1>TOP ASIAN DESTINATIONS</h1>
		
		<?php 
		$i=0;
		foreach ($hot_cities as $hot_city) {
			$i++;
		?>
		<!--column-->
		<article class="top-destination-box one-fourth<?php if($i%4==0) echo " last";?>">
			<figure><a href="{{ url:site uri='tour/search' }}/1/<?php echo $hot_city->country_id;?>/<?php echo $hot_city->city_id;?>" title="">{{ theme:image file="destinations/<?php echo $hot_city->city_name;?>.jpg" alt="" width="270" height="152" }}<div><?php echo $hot_city->city_name;?></div></a></figure>
		</article>
		<!--//column-->
		<?php } ?>
	</section>
	<!--//top destinations-->
	
	
	<!--info boxes-->
	<section class="boxes clearfix">
		<!--column-->
		<article class="one-fourth instagram-box">
			<div class="instagram-photos">
				{{ theme:image file="custom/instagram-logo.jpg" alt="" class="instagram-logo" }}
			<?php
			if(!empty($shots->data)){
				$firstImage='';
				$instagramImage='';
				$shotIndex=0;
				foreach($shots->data as $istg){
					//If you want to display another size, you can use 'low_resolution', or 'standard_resolution' in place of 'thumbnail'
					$istg_thumbnail = $istg->{'images'}->{'thumbnail'}->{'url'};
					$istg_image = $istg->{'images'}->{'low_resolution'}->{'url'};
			
					//The link
					$istg_link = $istg->{'link'};
			
					//The caption
					$istg_caption = isset($istg->{'caption'}->{'text'})?$istg->{'caption'}->{'text'}:'No caption';
			
					//The markup
					if($shotIndex==0){
						$firstImage.='<a href="'.$istg_link.'">';
						$firstImage.='<img src="'.$istg_image.'" alt="'.$istg_caption.'" title="'.$istg_caption.'" />';
						$firstImage.='</a>';
						$instagramImage.='<div class="img-thumb selected">
										<a href="javascript:;" ref-image="'.$istg_image.'" ref-link="'.$istg_link.'"
											alt="'.$istg_caption.'" title="'.$istg_caption.'"><img src="'.$istg_thumbnail.'" alt="'.$istg_caption.'" title="'.$istg_caption.'" /></a>
									</div>';
					} else {
						$instagramImage.='<div class="img-thumb">
										<a href="javascript:;" ref-image="'.$istg_image.'" ref-link="'.$istg_link.'"
											alt="'.$istg_caption.'" title="'.$istg_caption.'"><img src="'.$istg_thumbnail.'" alt="'.$istg_caption.'" title="'.$istg_caption.'" /></a>
									</div>';
					}
					$shotIndex++;
				}
				$instagramWidth=80*$shotIndex+10;
			?>
				<div class="main-photo">
					<?php echo $firstImage;?>
				</div>
				<div class="photos-container">
					<div style="width: <?php echo $instagramWidth;?>px;">
						<?php echo $instagramImage;?>
					</div>
				</div>
				<?php } else { ?>
				<p>No photo</p>
			<?php }?>
			</div>
		</article>
		<!--//column-->
		
		<!--column-->
		<article class="one-fourth diaries-box">
			<div class="heading1">ON<span class="semi-bold">GO</span> EXCLUSIVE DIARIES</div>
			<div class="heading1 small semi-bold">The City That Never Sleeps.</div>
			<p>Step into the amorous nightlife and savoury food trails of one of Asia's most densely populated cities, Hong Kong. >> <span class="semi-bold">READ MORE</span></p>
			{{ theme:image file="custom/video-sample.png" alt="" class="responsive" }}
		</article>
		<!--//column-->
		
		<!--column-->
		<article class="one-fourth shop-box last">
			{{ theme:image file="custom/shop.png" alt="" }}
			<div>
				<div class="prod-container">
					<p>Timbuk2 Classic Messenger Large</p>
					{{ theme:image file="custom/prod1.jpg" alt="" }}
					<a class="gradient-button" title="Add to cart" href="#">Add to cart</a>
					<p>Fujifilm Polaroid Camera Instax Mini 8 Pink</p>	
					{{ theme:image file="custom/prod2.jpg" alt="" }}
					<a class="gradient-button" title="Add to cart" href="#">Add to cart</a>
				</div>
			</div>
		</article>
		<!--//column-->
		
		<!--column-->
		<article class="one-fourth">
			<h2>Handpicked Destinations</h2>
			<p>We know you love to travel and want to make the most of it. That's why we have the best source of tours & attractions in Asia at great prices.</p>
		</article>
		<!--//column-->
		
		<!--column-->
		<article class="one-fourth">
			<h2>Clear Itinerary</h2>
			<p>To give you an accurate impression of the tour / attraction, we endeavor to publish transparent, balanced and precise itinerary descriptions. </p>
		</article>
		<!--//column-->
		
		<!--column-->
		<article class="one-fourth">
			<h2>Current Knowledge</h2>
			<p>We've done our research. Our scouts are always busy finding out more about our selected destinations and activities on offer in the Asian region.</p>
		</article>
		<!--//column-->
		
		<!--column-->
		<article class="one-fourth last">
			<h2>Secure Booking</h2>
			<p>Our reservation system is secure.
Your credit card and personal information are encrypted to offer 
high standards of guaranted privacy.</p>
		</article>
		<!--//column-->
		
		<!--column-->
		<article class="one-fourth ad-box">
			{{ theme:image file="custom/ad.jpg" alt="" class="responsive" }}
		</article>
		<!--//column-->
		
		<!--column-->
		<article class="one-fourth last">
			<h2>Are You A Tour Operator?</h2>
			<p>We are looking for operators and travel partners of Asian destinations to promote their awesome deals with us. Send us a <a href="contact.html" title="Contact">message</a> with your free advertising query and voila!</p>
		</article>
		<!--//column-->
	</section>
	<!--//info boxes-->
</div>