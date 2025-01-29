{*
 * HeaderGrid Template
 * @docs https://kreativkonzentrat.de/Wiki?page=dropper/dev/template
 * @generator https://kreativkonzentrat.de/Drop-Builder
 *}

<div class="kalitec-header-grid" data-drop-id="{$drop._internal.guid}">
	<div class="container">
		<div class="row">
		{* smartphone view *}
		{if $isMobile && !$isTablet}
			{foreach $drop.teaser as $hTeaser}
				{if $hTeaser.bgcol === "bg-white"}
					{$hTextCol = "text-primary"}
				{else}
					{$hTextCol = "text-white"}
				{/if}
				{if $hTeaser@iteration === 1}
					<div class="col-12 col-lg-8 first-hTeaser mb-3 order-0" data-teaser-iteration="{$hTeaser@iteration}">
						{if isset($hTeaser.link) && !empty($hTeaser.link.url)}<a {$hTeaser.link.attrs} class="mlink position-absolute d-block d-md-none"></a>{/if}
				{elseif $hTeaser@iteration === 2}
					<div class="col-12 col-md-6 col-lg-4 second-hTeaser mb-3 order-2" data-teaser-iteration="{$hTeaser@iteration}">
						{if isset($hTeaser.link) && !empty($hTeaser.link.url)}<a {$hTeaser.link.attrs} class="mlink position-absolute d-block d-md-none"></a>{/if}
				{else}
					{if $hTeaser@iteration <= 5}
					<div class="col-12 col-md-6 col-lg-6 other-hTeaser mb-3 order-1" data-teaser-iteration="{$hTeaser@iteration}">
						{if isset($hTeaser.link) && !empty($hTeaser.link.url)}<a {$hTeaser.link.attrs} class="mlink position-absolute d-block d-md-none"></a>{/if}
					{/if}
				{/if}

					<div class="{$hTextCol} {if $hTeaser@iteration === 1}text-center p-3{/if} text-uppercase position-relative inner d-flex {$hTeaser.bgcol} {$hTeaser.showbadge}">
						{if isset({$hTeaser.bgimg}) && !empty({$hTeaser.bgimg})}
							<div class="teaserImg position-absolute image-{$hTeaser.negativeMargin}">
								<img src="{$hTeaser.bgimg}" alt="{$hTeaser.headline}">
							</div>
						{/if}

						<div class="inner-wrap w-100">
						
							<h2 class="{$hTextCol} {if !empty($hTeaser.subhead)}mb-0 pb-0{/if}">{$hTeaser.headline}</h2>
							<h3 class="{$hTextCol} h2 fw-lighter mb-0 pb-0">{$hTeaser.subhead}</h3>
							{if $hTeaser@iteration > 1 && !$isMobile}
								<div class="rte-content">
									{$hTeaser.description}
								</div>
							{/if}
							{if isset($hTeaser.link) && !empty($hTeaser.link.url)}
								<div class="inner-btn d-block pt-3 {if $hTeaser@iteration === 1}text-center{else}position-absolute text-right{/if}">
									<a {$hTeaser.link.attrs} class="d-inline-block btn {if $hTeaser.bgcol === "bg-white"}btn-primary{else}btn-outline-white{/if}">{if $hTeaser@iteration === 1}{$hTeaser.link.title}{else}<i class="fa fa-arrow-right"></i>{/if}</a>
								</div>
							{/if}
						</div>
					</div>

				{if $hTeaser@iteration <= 5}
					</div>
				{/if}
			{/foreach}
		{else}
			{* tablet view *}
			<div class="col-12 col-lg-8 big-teasers">
				<div class="row">
				{foreach $drop.teaser as $hTeaser}
					{if $hTeaser.bgcol === "bg-white"}
						{$hTextCol = "text-primary"}
					{else}
						{$hTextCol = "text-white"}
					{/if}
					{if $hTeaser@iteration !== 2}
						{if $hTeaser@iteration === 1}
							<div class="col-12 col-lg-12 first-hTeaser mb-3" data-teaser-iteration="{$hTeaser@iteration}">
								{if isset($hTeaser.link) && !empty($hTeaser.link.url)}<a {$hTeaser.link.attrs} class="mlink position-absolute d-block d-md-none"></a>{/if}
						{else}
							{if $hTeaser@iteration <= 5 && $hTeaser@iteration > 2}
						
							<div class="col-12 col-md-6 col-lg-6 other-hTeaser mb-3" data-teaser-iteration="{$hTeaser@iteration}">
								{if isset($hTeaser.link) && !empty($hTeaser.link.url)}<a {$hTeaser.link.attrs} class="mlink position-absolute d-block d-md-none"></a>{/if}
							{/if}
						{/if}
		
							<div class="{$hTextCol} {if $hTeaser@iteration === 1}text-center p-3{/if} text-uppercase position-relative inner d-flex {$hTeaser.bgcol} {$hTeaser.showbadge}">
								{if isset({$hTeaser.bgimg}) && !empty({$hTeaser.bgimg})}
									<div class="teaserImg position-absolute image-{$hTeaser.negativeMargin}">
										<img src="{$hTeaser.bgimg}" alt="{$hTeaser.headline}">
									</div>
								{/if}
		
								<div class="inner-wrap w-100">
								
									<h2 class="{$hTextCol} {if !empty($hTeaser.subhead)}mb-0 pb-0{/if}">{$hTeaser.headline}</h2>
									<h3 class="{$hTextCol} h2 fw-lighter mb-0 pb-0">{$hTeaser.subhead}</h3>

									{if $hTeaser@iteration > 1 && !$isMobile}
										<div class="rte-content">
											{$hTeaser.description}
										</div>
									{/if}
									{if isset($hTeaser.link) && !empty($hTeaser.link.url)}
										<div class="inner-btn d-block pt-3 {if $hTeaser@iteration === 1}text-center{else}position-absolute text-right{/if}">
											<a {$hTeaser.link.attrs} class="d-inline-block btn {if $hTeaser.bgcol === "bg-white"}btn-primary{else}btn-outline-white{/if}">{if $hTeaser@iteration === 1}{$hTeaser.link.title}{else}<i class="fa fa-arrow-right"></i>{/if}</a>
										</div>
									{/if}
								</div>
							</div>
		
						{if ($hTeaser@iteration <= 5 && $hTeaser@iteration > 2) || $hTeaser@iteration === 1}
							</div>
						{/if}
	
					{/if}
				{/foreach}
				</div>
			</div>

			<div class="col-12 col-lg-4 single-teaser">
				<div class="row h-100">
				{foreach $drop.teaser as $hTeaser}
					{if $hTeaser.bgcol === "bg-white"}
						{$hTextCol = "text-primary"}
					{else}
						{$hTextCol = "text-white"}
					{/if}
					{if $hTeaser@iteration === 2}
						<div class="col-12 second-hTeaser mb-3" data-teaser-iteration="{$hTeaser@iteration}">
							{if isset($hTeaser.link) && !empty($hTeaser.link.url)}<a {$hTeaser.link.attrs} class="mlink position-absolute d-block d-md-none"></a>{/if}
				
	
						<div class="h-100 {$hTextCol} {if $hTeaser@iteration === 1}text-center p-3{/if} text-uppercase position-relative inner d-flex {$hTeaser.bgcol} {$hTeaser.showbadge}">
							{if isset({$hTeaser.bgimg}) && !empty({$hTeaser.bgimg})}
								<div class="teaserImg position-relative image-{$hTeaser.negativeMargin}">
									<img src="{$hTeaser.bgimg}" alt="{$hTeaser.headline}">
								</div>
							{/if}
	
							<div class="inner-wrap w-100">
							
								<h2 class="{$hTextCol} {if !empty($hTeaser.subhead)}mb-0 pb-0{/if}">{$hTeaser.headline}</h2>
								<h3 class="{$hTextCol} h2 fw-lighter mb-0 pb-0">{$hTeaser.subhead}</h3>
								{if $hTeaser@iteration > 1 && !$isMobile}
									<div class="rte-content">
										{$hTeaser.description}
									</div>
								{/if}
								{if $hTeaser@iteration > 1 && $isMobile && $isTablet}
									<div class="rte-content tablet">
										{$hTeaser.description}
									</div>
								{/if}
								{if isset($hTeaser.link) && !empty($hTeaser.link.url)}
									<div class="inner-btn d-block pt-3 {if $hTeaser@iteration === 1}text-center{else}position-absolute text-right{/if}">
										<a {$hTeaser.link.attrs} class="d-inline-block btn {if $hTeaser.bgcol === "bg-white"}btn-primary{else}btn-outline-white{/if}">{if $hTeaser@iteration === 1}{$hTeaser.link.title}{else}<i class="fa fa-arrow-right"></i>{/if}</a>
									</div>
								{/if}
							</div>
						</div>
	
				
						</div>
					{/if}
				{/foreach}
				</div>
			</div>
		{/if}
		</div>
	</div>
</div>
