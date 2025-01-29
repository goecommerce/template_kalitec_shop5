{block name='layout-header-head-resources-preload'}
{*nothing to preload*}
{/block}

{block name='layout-header-body-tag'}
<body class="{if $Einstellungen.template.theme.button_animated === 'Y'}btn-animated{/if}
             {if $Einstellungen.template.theme.wish_compare_animation === 'mobile'
                || $Einstellungen.template.theme.wish_compare_animation === 'both'}wish-compare-animation-mobile{/if}
             {if $Einstellungen.template.theme.wish_compare_animation === 'desktop'
                || $Einstellungen.template.theme.wish_compare_animation === 'both'}wish-compare-animation-desktop{/if}
             {if $isMobile}is-mobile{/if}
             {if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG} checkout{/if} is-nova"
      data-page="{$nSeitenTyp}"
      {if isset($Link) && !empty($Link->getIdentifier())} id="{$Link->getIdentifier()}"{/if}>
{/block}

{block name='layout-header-container-inner'}
<div class="{if $headerWidth === 'B'}container{else}container-fluid {if $headerWidth === 'N'}container-fluid-xl{/if}{/if}">
{block name='layout-header-category-nav'}
    {block name='layout-header-category-nav-logo'}
        {include file='layout/header_logo.tpl'}
    {/block}
    {navbar toggleable=true fill=true type="expand-lg" class="justify-content-start {if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG}align-items-center-util{else}align-items-lg-end{/if}"}
        {if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG}
            {block name='layout-header-branding-shop-nav'}
                {include file='layout/header_nav_icons.tpl'}
            {/block}

            {block name='layout-header-include-categories-mega'}
                {include file='layout/header_categories.tpl' menuMultipleRows=false}
            {/block}
        {else}
            {block name='layout-header-branding-shop-nav'}
                {include file='layout/header_nav_icons.tpl'}
            {/block}

            {block name='layout-header-include-categories-mega'}
                {include file='layout/header_categories.tpl' menuMultipleRows=false}
            {/block}
        {/if}
    {/navbar}
{/block}
</div>
{/block}