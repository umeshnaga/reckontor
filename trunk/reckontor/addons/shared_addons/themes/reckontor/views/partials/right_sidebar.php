<div class="f-right sidebar">	
	<div class="why-here component">
		<div class="heading heading2">WHY<br/> ON<span class="white">GO</span>ASIA</div>
		<a href="javascript:;" class="faq">FAQs</a>
	</div>
	
	<div class="top-dest component">
		<div class="heading small heading3">EXPLORE TOP DESTINATIONS</div>
		<ul>
		<?php foreach ($hot_cities as $i => $hot_city) { ?>
			<li><a
				href="{{ url:site uri='tour/search/1/<?php echo $hot_city->country_id;?>/<?php echo $hot_city->city_id;?>' }}"
				class="inverse-txt inverse-link info-label strong"><?php echo $hot_city->city_name;?>
			</a>
			</li>
			<?php }?>
		</ul>
	</div>
	
	<div class="contact-us component">
		<div class="heading small heading4">CONTACT<br/>US.</div>
		<a href="javascript:;" class="customer_care">CUSTOMER CARE</a>
		<a href="javascript:;" class="enquiry">ENQUIRY</a>
		<a href="javascript:;" class="feedback">FEEDBACK</a>
		<p>FOR SALES ENQUIRY<br/> EMAIL US AT <a href="mailto:SALES@ONGOASIA.COM">SALES@ONGOASIA.COM</a></p>
	</div>
	
	<div class="connect-us component">
		<div class="heading small heading5">CONNECT<br/>WITH<br/>US.</div>
		<a href="javascript:;">{{ theme:image file="facebook.png" alt="" title="" }}</a><div class="clear"></div>
		<a href="javascript:;">{{ theme:image file="twitter.png" alt="" title="" }}</a>
		<a href="javascript:;">{{ theme:image file="instagram.png" alt="" title="" }}</a>
		<a href="javascript:;">{{ theme:image file="pinterest.png" alt="" title="" }}</a>
		<div class="clear"></div>
	</div>
</div>

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