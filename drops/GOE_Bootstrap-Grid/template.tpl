{*
 * Bootstrap-Grid Template
 * @docs https://kreativkonzentrat.de/Wiki?page=dropper/dev/template
 * @generator https://kreativkonzentrat.de/Drop-Builder
 *}

<div class="goe-bootstrap-grid goe-bootstrap-grid-{$drop._internal.guid} {$drop.classes}" {if !empty($drop.hash)}id="{$drop.hash}"{/if}>
	<!-- Place your drop template here. Here is a dump of your drop data -->
	{foreach $drop.row as $row}
		<div class="row {$row.classes}" {if !empty($row.hash)}id="{$row.hash}"{/if}>
		{foreach $row.col as $col}
			<div class="{$col.colwidth} {$col.colwidthmd} {$col.colwidthlg} {$col.colwidthxl} {foreach $col.offset as $coladdition}{$coladdition} {/foreach} {$col.classes}" {if !empty($col.hash)}id="{$col.hash}"{/if}>
				{$col.content}
			</div>
		{/foreach}
		</div>
		
	{/foreach}
</div>