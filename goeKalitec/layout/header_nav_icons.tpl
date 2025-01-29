{block name='layout-header-nav-icons'}
    {nav id="shop-nav" right=true class="nav-right order-lg-last nav-icons"}
        {if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG}
            {block name='layout-header-nav-icons-include-header-nav-back'}
                <a href="{get_static_route id='warenkorb.php'}" class="btn btn-sm btn-outline-primary d-flex align-center justify-content-center"><i class="fa fa-chevron-left fa1x"></i> <span>{lang key="back" section="global"} <span class="d-none d-md-inline">{lang key="gotoBasket" section="global"}</span></span></a>
            {/block}

        {else}
            {block name='layout-dropper-service'}
                <div id="dropper-service-desktop" class="d-none d-lg-block"></div>
            {/block}
            {block name='layout-header-nav-icons-include-header-nav-search'}
                {include file='layout/header_nav_search.tpl' tag='li'}
            {/block}
            {block name='layout-header-nav-icons-include-currency-dropdown'}
                {if $Einstellungen.template.header.menu_show_topbar === 'N' && !$isMobile}
                    {include file='snippets/currency_dropdown.tpl'}
                {/if}
            {/block}
            {if !$isMobile}
                {block name='layout-header-nav-icons-include-language-dropdown'}
                    {include file='snippets/language_dropdown.tpl' dropdownClass="d-flex {if $Einstellungen.template.header.menu_show_topbar === 'Y'}d-lg-none{/if}"}
                {/block}
            {/if}
            {if $isMobile}
                {block name='layout-header-nav-icons-include-header-shop-nav-account'}
                    {include file='layout/header_shop_nav_account.tpl'}
                {/block}
            {/if}
            {if !$isMobile}
                {if $Einstellungen.vergleichsliste.vergleichsliste_anzeigen === 'Y'}
                    {block name='layout-header-nav-icons-include-header-shop-nav-compare'}
                        {include file='layout/header_shop_nav_compare.tpl'}
                    {/block}
                {/if}
                {block name='layout-header-nav-icons-include-header-shop-nav-wish'}
                    {include file='layout/header_shop_nav_wish.tpl'}
                {/block}
            {/if}
            {block name='layout-header-nav-icons-include-cart-dropdown-label'}
                {include file='basket/cart_dropdown_label.tpl'}
            {/block}
            {block name='layout-header-logo-navbar-toggle-icon'}
                <li>
                    <button id="burger-menu" class="mr-0 nav-link burger-menu-wrapper navbar-toggler collapsed {if $nSeitenTyp === $smarty.const.PAGE_BESTELLVORGANG}d-none{/if}" type="button" data-toggle="collapse" data-target="#mainNavigation" aria-controls="mainNavigation" aria-expanded="false" aria-label="Toggle navigation">
                        <i class="fa fa-bars"></i>
                    </button>
                </li>
            {/block}
        {/if}
    {/nav}
{/block}
