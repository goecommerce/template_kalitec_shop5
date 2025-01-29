{*
 * Bild Text Element Template
 * @docs https://kreativkonzentrat.de/Wiki?page=dropper/dev/template
 * @generator https://kreativkonzentrat.de/Drop-Builder
 *}
 {if $drop.backgroundColor === "bg-white"}
	{$hTextCol = "text-primary"}
{else}
	{$hTextCol = "text-white"}
{/if}
{if $drop.bgstyle == "bgimg"}
	{$hTextCol = "text-white"}
{/if}
<div class="image-breaker position-relative" data-drop-id="{$drop._internal.guid}" {if !$isMobile}{if !empty($drop.deskimage)}style="background-image:url({$drop.deskimage})"{/if}{/if}>
	<div class="container position-relative">
		<div class="row">
			<div class="col-12 col-md-6 col-lg-6 p-0 image">
				{if !empty($drop.image)}<img src="{$drop.image}" alt="" class="w-100 {if !$isMobile}visibility-hidden{/if}">{/if}
			</div>
			<div class="col-12 col-md-6 col-lg-6 pt-3 pb-3 content {$hTextCol} {if $drop.bgstyle == "colored"}{$drop.backgroundColor}{/if}" {if $drop.bgstyle == "bgimg" && !empty($drop.backgroundImage) && $isMobile}style="background-image:url({$drop.backgroundImage})"{/if} >
				<h2 class="pt-3 fw-lighter {$hTextCol}">{$drop.headline}</h2>
				<p class="{$hTextCol}">{$drop.text}</p>
				{if !empty($drop.link)}
					<a {$drop.link.attrs} class="btn  {if $hTextCol === "text-primary"}btn-outline-primary{else}btn-outline-white{/if} d-block d-md-inline-block text-uppercase mt-4 mb-3">{$drop.link.title}</a>
				{/if}
			</div>
		</div>
	</div>
</div>
