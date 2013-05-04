<script>
$(document).ready(function(){
	// Lowering the opacity of all slide in divs
	$('.banner div').css('opacity',0.4);

	// Using the hover method 
	$('.banner').hover(function(){
		// Executed on mouseenter
		var el = $(this);
		// Find all the divs inside the banner div,
		// and animate them with the new size
		el.find('div').stop().animate({width:200,height:200},'slow',function(){
			// Show the "Visit Company" text:
			el.find('p').fadeIn('fast');
		});

	},function(){
		// Executed on moseleave
		var el = $(this);
		// Hiding the text
		el.find('p').stop(true,true).hide();
		// Animating the divs
		el.find('div').stop().animate({width:60,height:60},'fast');
	}).click(function(){
		// When clicked, open a tab with the address of the hyperlink
		window.open($(this).find('a').attr('href'));
		
	});
});

$(document).ready(function(){
	$('#banner_slides').slides({
		effect:'fade',
        generateNextPrev: false,
        play: 5000,
        hoverPause: false,
        pause: 500,
       generatePagination: true
    });
});
</script>

<div class="mod basic viamod viamod-bar-hd hanging mhn destination-list">
	<b class="top"><b class="tl"></b><b class="tr"></b></b>
	<div class="inner">
		<div class="hd">
		</div>
		<div class="bd inverse-txt">
			<div id="banner_slides">
				<div class="slidesContainer" id="billBoard" style="height: 312px">
				<?php
				foreach ($banner_groups as $i => $banners) {
				 
				?>
				<ul class="bannerHolder">
				<?php
				
				foreach ($banners as $i => $banner) {
				?>
				<li>
				<div class="banner">
					<a href="<?php echo $banner->url;?>">
						<img src="{{url:base}}uploads/default/files/banners/<?php echo $banner->image;?>" alt="<?php echo $banner->company;?>" width="130" height="130" />
					</a>
					<p class="companyInfo">Visit <?php echo $banner->company;?></p>
					<div class="cornerTL"></div>
					<div class="cornerTR"></div>
					<div class="cornerBL"></div>
					<div class="cornerBR"></div>
				</div>
				</li>
				<?php 
				}
				?>
				</ul>
				<?php 
				}
				?>
				</div>
			</div>
		</div>
	</div>
</div>












<div style="clear: both;margin-bottom: 10px">
</div>
<div id="instagram_photos">
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
?>
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
<?php } else { ?>
			<div class="bd">
				<div id="tile_detail_container">
					<p class="mhn mbs strong large white-text">
						No photo
					</p>
				</div>
			</div>
<?php }?>
		</div>
		<b class="bottom"><b class="bl"></b><b class="br"></b> </b>
	</div>
</div>
