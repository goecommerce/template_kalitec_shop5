{*
 * KachelTeaser Template
 * @docs https://kreativkonzentrat.de/Wiki?page=dropper/dev/template
 * @generator https://kreativkonzentrat.de/Drop-Builder
 *}

{if $drop.tile|count == 1}
	{$tileWrap = "col-12"}
{elseif $drop.tile|count == 2}
	{$tileWrap = "col-12 col-md-6"}
{elseif $drop.tile|count == 3}
	{$tileWrap = "col-12 col-md-4"}
{elseif $drop.tile|count >= 4}
	{$tileWrap = "col-12 col-md-3"}
{/if}

<div class="tile-teaser ml-n3 mr-n3">
	<div class="tile-teaser-bg-fix position-absolute d-none d-md-block">
		<div class="row h-100">
		{foreach $drop.tile as $kTileB}
			<div class="{$tileWrap} {$kTileB.bgcol} h-100">
			</div>
		{/foreach}
		</div>
	</div>
	<div class="container">
		<div class="row" data-tile-count="{$drop.tile|count}">
			{foreach $drop.tile as $kTile}
				{if empty($kTile.link)}
					<div class="{$tileWrap} ttwx text-center {$kTile.bgcol}" data-icontype="{$kTile.icontype}">
				{else}
					<a class="{$tileWrap} ttwx text-center {$kTile.bgcol}" data-icontype="{$kTile.icontype}" {$kTile.link.attrs}>
				{/if}
						<div class="p-3 ttwxi">
							{if $kTile.icontype === "select"}
								<p class="pt-3"><i class="{$kTile.icon}"></i></p>
							{/if}
							<p class="h2 fw-light"><span class="fw-bold">{$kTile._internal.name}:</span> {$kTile.headline}</p>
							<p>{$kTile.text}</p>
						</div>
				{if empty($kTile.link)}
					</div>
				{else}
					</a>
				{/if}
			{/foreach}
		</div>
	</div>
</div>