{block name='layout-header-top-bar'}
    {strip}
        
        {nav tag='ul' class='topbar-main nav-dividers'}
            {block name='layout-header-top-bar-user-settings'}

                {if $Einstellungen.vergleichsliste.vergleichsliste_anzeigen === 'Y'}
                    {block name='layout-header-nav-icons-include-header-shop-nav-compare-top-bar'}
                        {include file='layout/header_shop_nav_compare.tpl'}
                    {/block}
                {/if}

                {block name='layout-header-nav-icons-include-header-shop-nav-wish-top-bar'}
                    {include file='layout/header_shop_nav_wish.tpl'}
                {/block}

                {block name='layout-header-top-bar-user-top-bar'}
                    {include file='layout/header_shop_nav_account.tpl'}
                {/block}

                {block name='layout-header-top-bar-user-settings-currency'}
                    {include file='snippets/currency_dropdown.tpl'}
                {/block}
                {block name='layout-header-top-bar-user-settings-include-language-dropdown'}
                    {include file='snippets/language_dropdown.tpl'}
                {/block}
            {/block}
        {if $linkgroups->getLinkGroupByTemplate('Kopf') !== null && $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}
            {block name='layout-header-top-bar-cms-pages'}
                {foreach $linkgroups->getLinkGroupByTemplate('Kopf')->getLinks() as $Link}
                    {navitem active=$Link->getIsActive() href=$Link->getURL() title=$Link->getTitle() target=$Link->getTarget()}
                        {$Link->getName()}
                    {/navitem}
                {/foreach}
            {/block}
        {/if}
        {/nav}
        {if $linkgroups->getLinkGroupByTemplate('USP') !== null && $nSeitenTyp !== $smarty.const.PAGE_BESTELLVORGANG}
            {nav tag='ul' class='topbar-main nav-dividers ml-0 mr-auto'}
            {block name='layout-header-top-bar-usp-pages'}
                {foreach $linkgroups->getLinkGroupByTemplate('USP')->getLinks() as $Link}
                    {navitem active=$Link->getIsActive() href=$Link->getURL() title=$Link->getTitle() target=$Link->getTarget()}
                     <i class="fas fa-check"></i> <spann class="fw-bold text-uppercase">{$Link->getName()}</span>
                    {/navitem}
                {/foreach}
            {/block}
            {/nav}
        {/if}
    {/strip}
{/block}
