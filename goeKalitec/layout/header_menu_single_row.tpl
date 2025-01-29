
{block name='layout-header-menu-single-row-nav-main-inner'}
    {if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG}
        {block name='layout-header-menu-single-row-secure-checkout'}
            {block name='layout-header-menu-single-row-include-header-nav-search'}

            {/block}
            {block name='layout-header-menu-single-row-icons'}
                {col class="col-auto nav-icons-wrapper order-lg-3"}
                    {include file='layout/header_nav_icons.tpl'}
                {/col}
            {/block}
        {/block}
    {else}
        {block name='layout-header-menu-single-row-include-header-nav-search'}

        {/block}
        {block name='layout-header-menu-single-row-icons'}
            {col class="col-auto nav-icons-wrapper order-lg-3"}
                {include file='layout/header_nav_icons.tpl'}
            {/col}
        {/block}
    {/if}
{/block}
