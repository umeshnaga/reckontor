<script type="text/javascript">
$(document).ready(function(){
    	$('#destImages').slides({
            play: 4000,
            fadeSpeed: 0,
            effect: 'fade',
            generatePagination: false,
            hoverPause: false,
            preload: true
        });
});
</script>
<div style="margin-top: 10px;">
	<div
		class="mod basic viamod viamod-bar-hd hanging mhn destination-list">
		<b class="top"><b class="tl"></b><b class="tr"></b> </b>
		<div class="inner">
			<div id="destImages">
				<div class="slidesContainer">
					{{ theme:image id="slide_img" file="1_002.jpg" alt=""
					class="hero-img" }}
					<div class="slideUnit">{{ theme:image id="slide_img" file="1.jpg"
						alt="" class="hero-img" }}</div>
					<div class="slideUnit">{{ theme:image id="slide_img" file="2.jpg"
						alt="" class="hero-img" }}</div>
					<div class="slideUnit">{{ theme:image id="slide_img" file="3.jpg"
						alt="" class="hero-img" }}</div>
					<div class="slideUnit">{{ theme:image id="slide_img" file="4.jpg"
						alt="" class="hero-img" }}</div>
					<div class="slideUnit">{{ theme:image id="slide_img" file="5.jpg"
						alt="" class="hero-img" }}</div>
					<div class="slideUnit">{{ theme:image id="slide_img" file="6.jpg"
						alt="" class="hero-img" }}</div>
					<div class="slideUnit">{{ theme:image id="slide_img" file="7.jpg"
						alt="" class="hero-img" }}</div>
					<div class="slideUnit">{{ theme:image id="slide_img" file="8.jpg"
						alt="" class="hero-img" }}</div>
					<div class="slideUnit">{{ theme:image id="slide_img" file="9.jpg"
						alt="" class="hero-img" }}</div>
					<div class="slideUnit">{{ theme:image id="slide_img" file="11.jpg"
						alt="" class="hero-img" }}</div>
					<div class="slideUnit">{{ theme:image id="slide_img" file="12.jpg"
						alt="" class="hero-img" }}</div>

				</div>
			</div>

			<div class="hd">
				<div class="line hd-border mhm">
					<div class="mtm mod-header media mhn mbs h1">
						<i class="icon icon-hands-up-l img"></i>
						<div class="bd pbs">
							Let the <br>Activities Begin
						</div>
					</div>
				</div>
			</div>
			<div class="bd inverse-txt">

				<div class="mhm viamod-border-b">

					<h3 class="info-label strong mbn mhn h5">
						<a href="javascript:;" class="inverse-link">North America</a><a
							href="javascript:;" class="no-hover"><i
							class="icon icon-arrow-east mls"></i> </a>
					</h3>
					<p class="mtn mhn xsmall">
						<a href="javascript:;" class="inverse-link">New York</a>, <a
							href="javascript:;" class="inverse-link">Las Vegas</a>, <a
							href="javascript:;" class="inverse-link">Grand Canyon</a>, <a
							href="javascript:;" class="inverse-link">San Francisco</a>, <a
							href="javascript:;" class="inverse-link">Los Angeles</a>, <a
							href="javascript:;" class="inverse-link">Oahu</a>, <a
							href="javascript:;" class="inverse-link">New Orleans</a>, <a
							href="javascript:;" class="inverse-link">Orlando</a>, <a
							href="javascript:;" class="inverse-link">Washington DC</a>, <a
							href="javascript:;" class="inverse-link">Vancouver</a>, <a
							href="javascript:;" class="inverse-link">Montreal</a>, <a
							href="javascript:;" class="inverse-link">Cancun</a>, <a
							href="javascript:;" class="more-link inverse-link">See all
							&raquo;</a>
					</p>
				</div>

				<div class="mhm viamod-border-b" mmid="2510"
					layoutcode="FIND_TTD_1a" position="2">

					<h3 class="info-label strong mbn mhn h5">
						<a href="javascript:;" class="inverse-link">Europe</a><a
							href="javascript:;" class="no-hover"><i
							class="icon icon-arrow-east mls"></i> </a>
					</h3>
					<p class="mtn mhn xsmall">
						<a href="javascript:;" class="inverse-link">Paris</a>, <a
							href="javascript:;" class="inverse-link">London</a>, <a
							href="javascript:;" class="inverse-link">Rome</a>, <a
							href="javascript:;" class="inverse-link">Vatican</a>, <a
							href="javascript:;" class="inverse-link">Florence</a>, <a
							href="javascript:;" class="inverse-link">Venice</a>, <a
							href="javascript:;" class="inverse-link">Milan</a>, <a
							href="javascript:;" class="inverse-link">Barcelona</a>, <a
							href="javascript:;" class="inverse-link">Madrid</a>, <a
							href="javascript:;" class="inverse-link">Amsterdam</a>, <a
							href="javascript:;" class="more-link inverse-link">See all
							&raquo;</a>
					</p>
				</div>

				<div class="mhm viamod-border-b">

					<h3 class="info-label strong mbn mhn h5">
						<a href="javascript:;" class="inverse-link">Australia &amp;
							Pacific</a><a href="javascript:;" class="no-hover"><i
							class="icon icon-arrow-east mls"></i> </a>
					</h3>
					<p class="mtn mhn xsmall">
						<a href="javascript:;" class="inverse-link">Sydney</a>, <a
							href="javascript:;" class="inverse-link">Melbourne</a>, <a
							href="javascript:;" class="inverse-link">Cairns</a>, <a
							href="javascript:;" class="inverse-link">Ayers Rock</a>, <a
							href="javascript:;" class="inverse-link">Perth</a>, <a
							href="javascript:;" class="inverse-link">Australia</a>, <a
							href="javascript:;" class="inverse-link">Queenstown</a>, <a
							href="javascript:;" class="inverse-link">Auckland</a>, <a
							href="javascript:;" class="inverse-link">New Zealand</a>, <a
							href="javascript:;" class="more-link inverse-link">See all
							&raquo;</a>
					</p>
				</div>
			</div>
		</div>
		<b class="bottom"><b class="bl"></b><b class="br"></b> </b>
	</div>
</div>

<div id="instagram_photos">
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
			$firstImage.='<div id="main-image-container">
						<a href="'.$istg_link.'" id="tile_detail_link"
							class="img-link no-hover mtm">';
			$firstImage.='<img src="'.$istg_image.'" alt="'.$istg_caption.'" title="'.$istg_caption.'" class="imgC img-border main-image" />';
			$firstImage.='</a>';
			$firstImage.='<p class="mhn mbs strong large white-text">'.$istg_caption.'</p>';
			$firstImage.='</div>';
			$instagramImage.='<div class="img-thumb img-thumb-alt unit selected">
							<a href="javascript:;" ref-image="'.$istg_image.'" ref-link="'.$istg_link.'"
								alt="'.$istg_caption.'" title="'.$istg_caption.'"
								class="img-link no-hover"><img src="'.$istg_thumbnail.'" alt="'.$istg_caption.'" title="'.$istg_caption.'" class="imgC img-border main-image" /></a>
						</div>';
		} else {
			$instagramImage.='<div class="img-thumb img-thumb-alt unit">
							<a href="javascript:;" ref-image="'.$istg_image.'" ref-link="'.$istg_link.'"
								alt="'.$istg_caption.'" title="'.$istg_caption.'"
								class="img-link no-hover"><img src="'.$istg_thumbnail.'" alt="'.$istg_caption.'" title="'.$istg_caption.'" class="imgC img-border main-image" /></a>
						</div>';
		}
		$shotIndex++;
	}
	$instagramWidth=79*$shotIndex+10;
}
?>
	<div class="mod basic viamod mtn mhn">
		<b class="top"><b class="tl"></b><b class="tr"></b> </b>
		<div class="inner phm">
			<div class="hd">
				<div class="line hd-border mbm">
					<div class="mtl pbm mod-header media mhn mbn h3">
						<i class="icon icon-camera-l img"></i>
						<div class="bd">Featured Traveler Photos</div>
					</div>
				</div>
			</div>

			<div class="bd">
				<div id="tile_detail_container">
				<?php echo $firstImage;?>
				</div>
				<div class="gallery-thumbs pbm mvm">
					<div id="tile_img_container" style="width: <?php echo $instagramWidth;?>px;">
					<?php echo $instagramImage;?>
					</div>
				</div>
			</div>
		</div>
		<b class="bottom"><b class="bl"></b><b class="br"></b> </b>
	</div>
</div>
