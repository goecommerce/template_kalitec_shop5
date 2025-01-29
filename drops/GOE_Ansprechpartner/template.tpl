{*
 * Ansprechpartner Template
 * @docs https://kreativkonzentrat.de/Wiki?page=dropper/dev/template
 * @generator https://kreativkonzentrat.de/Drop-Builder
 *}

<div class="kalitec-contacts pb-3 mb-6">
	<div class="row">
		<h2 class="hr-sect fw-bold">{$drop.headline}</h2>
	</div>
	<div class="row ml-0 crow">
		{foreach $drop.contact as $contact}
			<div class="col-6 col-md-4 col-lg-3 mb-0 pl-0 pr-0">
				<img class="w-100" src="{$contact.image}" alt="{$contact.name}">
				<div class="p-3 bg-white">
					<p class="h4">{$contact.name}</p>
					<p>{$contact.text}</p>
					<a class="d-block" {$contact.phone.attrs}>{$contact.phone.title}</a>
					<a class="d-block" {$contact.mail.attrs}>{$contact.mail.title}</a>
				</div>
				<div class="row mr-0 ml-0">
					{if isset($contact.phone) && !empty($contact.phone)}
					<div class="pl-0 pr-0 col-{if (isset($contact.phone) && !empty($contact.phone)) && (isset($contact.mail) && !empty($contact.mail))}6{else}12{/if}">
						<a class="btn btn-primary w-100 border-0" {$contact.phone.attrs}><i class="fa fa-phone"></i></a>
					</div>
					{/if}
					{if isset($contact.mail) && !empty($contact.mail)}
					<div class="pl-0 pr-0 col-{if (isset($contact.phone) && !empty($contact.phone)) && (isset($contact.mail) && !empty($contact.mail))}6{else}12{/if}">
						<a class="btn btn-primary bg-info w-100 border-0" {$contact.mail.attrs}><i class="fa fa-envelope"></i></a>
					</div>
					{/if}
				</div>
			</div>
		{/foreach}
		{if $drop.unequal == "showteaser"}
			<div class="col-6 col-md-4 col-lg-3 mb-0 pl-0 pr-0" data-teaser-bgtype="{$drop.teaserbg}">
				<div class="{if $drop.teaserbg === 1}bg-gradient{else}bg-image{/if} h-100 p-3 text-center" {if $drop.teaserbg === 2}style="background-image:url({$drop.teaserbgimg});"{/if}> 
					<h2 class="text-center text-white text-uppercase">{$drop.teaserhead}</h2>
					<a {$drop.teaserlink.attrs} class="btn btn-outline-white">{$drop.teaserlink.title}</a>
				</div>
			</div>
		{/if}
	</div>
</div>