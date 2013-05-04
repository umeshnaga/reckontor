		<div class="main-col">
			<?php
			foreach ($cat_blogs_mapping as $categor_id => $cat_blogs) {
			?>
			<?php
				if($cat_blogs->category->title == 'Why book with us?' ||
				   $cat_blogs->category->title == 'About Ongoasia') {
			?>
			<div>
				<div class="mod basic viamod viamod-bar-hd mtm man">
					<b class="top"><b class="tl"></b><b class="tr"></b> </b>
					<div class="inner">
						<div class="hd hd-border mhl pvs">
							<h2 class="mtm pbs mod-header h1 xxxlarge"><?php echo $cat_blogs->category->title; ?></h2>
						</div>
						<div class="bd">
							<ul class="large inverse-txt mhl mbl">
							<?php
							$blogs = $cat_blogs->blogs;
							foreach ($blogs as $i => $blog) {
							?>
							
								<li class="ptxs"><i class="item"></i><?php echo  anchor('blog/'.date('Y/m/', $blog->created_on).$blog->slug, $blog->title, array('class' => 'inverse-link')); ?></li>
							<?php 
								}
							?>	
							</ul>
						</div>
					</div>
					<b class="bottom"><b class="bl"></b><b class="br"></b> </b>
				</div>
			</div>
			<?php			
			
				} else { ?>
			<div id="mm26050">
				<div class="mod basic viamod viamod-bar-hd mtm man">
					<b class="top"><b class="tl"></b><b class="tr"></b> </b>
					<div class="inner">
						<div class="hd">
							<h2 class="mhl ptxs pbm mod-header hd-border h1">
								<a class="inverse-txt inverse-link hover-alt"
									href="javascript:;"><?php echo $cat_blogs->category->title;?></a>
							</h2>
						</div>
						<div class="bd">
							<div class="mhm pbm">
							<?php
							$blogs = $cat_blogs->blogs;
							foreach ($blogs as $i => $blog) {
							?>
								<div class="media pbm viamod-border-b">


									<div class="bd">

										<p class="mts mbn inverse-txt small">
										<?php echo  anchor('blog/'.date('Y/m/', $blog->created_on).$blog->slug, $blog->title, array('class' => 'h3 strong inverse-link')); ?>
										<?php echo  anchor('blog/'.date('Y/m/', $blog->created_on).$blog->slug, '<i class="icon icon-arrow-east mls"></i>', array('class' => 'no-hover')); ?>
										</p>
										<p class="mod-txt mvn"><?php echo $blog->intro;?></p>
									</div>
								</div>
							<?php
							} 
							?>

							</div>
						</div>
					</div>
					<b class="bottom"><b class="bl"></b><b class="br"></b> </b>
				</div>
			</div>
			<?php 
				}
				   
			} 
			?>
			

		</div>

