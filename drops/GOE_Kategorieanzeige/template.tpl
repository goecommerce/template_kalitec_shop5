{*
 * Kategorieanzeige Template
 * @docs https://kreativkonzentrat.de/Wiki?page=dropper/dev/template
 * @generator https://kreativkonzentrat.de/Drop-Builder
 *}

<div class="katview pb-3">
	<div class="container">
		<div class="row">
				<h2 class="hr-sect">{$drop.headline}</h2>
				{if !empty($drop.text)} 
					<p class="pt-0 mt-n3 pb-3 text-center w-100">{$drop.text}</p>
				{/if}
		</div>
		<div class="row catrow">
		
			{foreach $drop.kategs as $kategorie}
				{foreach $drop.kategorieArray as $katArr}
					
					{if $kategorie === $katArr->kKategorie}
						{if (empty($katArr->tkategoriepict_cPfad) && $drop.noimg == "show") || !empty($katArr->tkategoriepict_cPfad)}
					<div class="kalitec-start-cat {if empty($drop.classes)}col-6 col-md-4 col-lg-3{else}{$drop.classes}{/if}" data-kat-id="{$kategorie}">
						<div class="wrap square-image square catwrap-gradient">
							
							<a class="kalitec-start-cat-link inner" href="/{$katArr->cSeo}">
								{if !empty($katArr->tkategoriepict_cPfad)}
									<img class="img-fluid" src="/media/image/category/{$katArr->kKategorie}/xl/{$katArr->tkategoriepict_cPfad}" alt="{$katArr->cName}" />
								{else}
									<img class="img-fluid catfallback" src="{$ShopLogoURL}" alt="{$katArr->cName}" />
								{/if}
							</a>
							
						</div>
						<a class="kalitec-start-cat-btn btn btn-invert-primary btn-block caption pl-3 pr-3 text-left" href="/{$katArr->cSeo}">{$katArr->cName}</a>
					</div>
						{/if}

						
					{/if}
				{/foreach}
				
			{/foreach}
		</div>
		{if !empty($drop.link)}
		<div class="row pt-3 mt-3 mb-3 pb-3">
			<div class="col-12 d-flex justify-content-center">
				<a {$drop.link.attrs} class="btn btn-outline-primary d-block d-md-inline-block">{$drop.link.title}</a>
			</div>
		</div>
		{/if}
	</div>
</div>
