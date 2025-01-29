{block name='basket-cart-dropdown-label'}
    <li class="cart-icon-dropdown nav-item dropdown {if $WarenkorbArtikelAnzahl != 0}not-empty{/if}">
        {block name='basket-cart-dropdown-label-link'}
            {link class='nav-link text-center' aria=['expanded' => 'false', 'label' => {lang key='basket'}] data=['toggle' => 'dropdown']}
                {block name='basket-cart-dropdown-label-count'}
                    <i class='fas fa-shopping-cart cart-icon-dropdown-icon mr-0'>
                        {if $WarenkorbArtikelAnzahl >= 1}
                        <span class="fa-sup" title="{$WarenkorbArtikelAnzahl}">
                            {$WarenkorbArtikelAnzahl}
                        </span>
                        {/if}
                    </i>
                {/block}
                {block name='basket-cart-dropdown-labelprice'}
                    <br class="d-none d-xl-block"><span class="iconText d-none d-xl-inline">{lang key="basket"}</span>
                    
                {/block}
            {/link}
        {/block}
        {block name='basket-cart-dropdown-label-include-cart-dropdown'}
            {include file='basket/cart_dropdown.tpl'}
        {/block}
    </li>
{/block}
