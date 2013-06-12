<div class="highlight">HIGHLIGHTS OF THE SEASON</div>
<div class="highlight-item">
	<div class="images">
		{{ theme:image file="img1.png" alt="" title="" class="main-image" }}
		{{ theme:image file="img2.png" alt="" title="" }}
		{{ theme:image file="img3.png" alt="" title="" }}
		{{ theme:image file="img4.png" alt="" title="" }}
	</div>
	<div class="text">
		<div class="title">SURF IN THEIR TURF</div>
		<div class="title sub-title">BALI, INDONESIA</div>
		<div class="title dest-title">Catch waves &amp; soak up the sun in sanctuary.</div>
		<div>Catch waves &amp; soak up the sun in sanctuary. Catch waves &amp; soak up the sun in sanctuary. Catch waves &amp; soak up the sun in sanctuary. Catch waves &amp; soak up the sun in sanctuary. </div>
		<a class="read-more" href="javascript:;">READ MORE >></a>
	</div>
	<div class="clear"></div>
</div>

<div class="highlight-item video-item">
	<div class="text">
		<div class="title">A CITY THAT NEVER SLEEPS</div>
		<div class="title sub-title">HONG KONG</div>
		<a class="read-more" href="javascript:;">READ<br/> MORE >></a>
	</div>
	<div class="video">
		{{ theme:image file="video.png" alt="" title="" }}
	</div>
	<div class="clear"></div>
</div>

<div class="line"></div>

<div class="highlight-item type2">
	<div class="images">
		{{ theme:image file="img5.png" alt="" title="" class="main-image" }}
		{{ theme:image file="img6.png" alt="" title="" }}
		{{ theme:image file="img7.png" alt="" title="" }}
		{{ theme:image file="img8.png" alt="" title="" }}
	</div>
	<div class="text">
		<div class="title">F1 NIGHT RACE</div>
		<div class="title sub-title">SINGAPORE</div>
		<div class="title dest-title">Fast &amp; furious in the Lion City.</div>
		<div>Catch waves &amp; soak up the sun in sanctuary. Catch waves &amp; soak up the sun in sanctuary. Catch waves &amp; soak up the sun in sanctuary. Catch waves &amp; soak up the sun in sanctuary. </div>
		<a class="read-more" href="javascript:;">READ MORE >></a>
	</div>
	<div class="clear"></div>
</div>

<div class="instagram-photos component">
	<div class="heading">TRAVELSHOTS ON THE GO</div>
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

<div class="hot-deals component">
	<div class="deal-item">SINGAPORE HOTELS WEEKEND PROMO FROM <span class="yellow">250SGD</span> INCLU BREAKFAST
		<input type="button" class="btn" value="GO!"/>
	</div>
	<div class="deal-item blue-item">BEERFEST ASIA<br/> VIP PASSES<br/><span class="yellow">20% OFF</span>
		<input type="button" class="btn" value="GO!"/>
	</div>
</div>

