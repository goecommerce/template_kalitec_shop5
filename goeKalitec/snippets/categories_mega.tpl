{block name='snippets-categories-mega-top-links-hr'}
    </ul>
    <ul class="mobile-sticky-menu">
        {get_static_route id='jtl.php' secure=true assign='secureAccountURL'}
        {if JTL\Session\Frontend::getCustomer()->getID() === 0}
            {navitem href=$secureAccountURL title="{lang key='myAccount'}"}
            <i class="fas fa-user"></i> {lang key='loginOrRegister' section="custom"}
            {/navitem}
        {else}
            
            {navitem href=$secureAccountURL title="{lang key='myAccount'}" class="justify-content-start"}
                <i class="fas fa-user"></i> {lang key='myAccount'}
            {/navitem}
            {navitem href="{$secureAccountURL}?bestellungen=1" title="{lang key='myAccount'}" class="justify-content-start"}
                <i class="fas fa-box"></i> {lang key='myOrders'}
            {/navitem}
            {*navitem href="{$secureAccountURL}?editRechnungsadresse=1" title="{lang key='myAccount'}" class="justify-content-start"}
                <i class="fas fa-id-card"></i> {lang key='myPersonalData'}
            {/navitem*}
            {*navitem href="{$secureAccountURL}?editLieferadresse=1" title="{lang key='myAccount'}" class="justify-content-start"}
                <i class="fas fa-file-import"></i> {lang key='myShippingAddresses'}
            {/navitem*}
            {navitem href="{$secureAccountURL}?logout=1" title="{lang key='logOut'}" class="account-icon-dropdown-logout" class="justify-content-start"}
                <i class="fas fa-sign-out-alt"></i> {lang key='logOut'}
            {/navitem}

        {/if}
{/block}

{block name='layout-header-top-bar-user-settings' append}
    {if $isMobile}
        {include file="snippets/language_dropdown_mobile.tpl"}
        <li id="dropper-sticky-mobile-menu-hook"></li>
    {/if}
    </ul> {* closing snippets-categories-mega-top-links-hr ul opening *}
{/block}

{block name='snippets-categories-mega-wishlist'}
    {if $Einstellungen.global.global_wunschliste_anzeigen === 'Y'}
        {navitem href="{get_static_route id='wunschliste.php'}" class="wl-nav-scrollbar-item nav-scrollbar-item"}
            <i class="fas fa-heart"></i>
            {lang key='wishlist'}
            {badge id="badge-wl-count" variant="primary" class="product-count ml-auto mr-0 align-center"}
                {if \JTL\Session\Frontend::getWishlist()->getID() > 0}
                    {\JTL\Session\Frontend::getWishlist()->getItems()|count}
                {else}
                    0
                {/if}
            {/badge}
        {/navitem}
    {/if}
    {/block}
    {block name='snippets-categories-mega-comparelist'}
    {if $Einstellungen.vergleichsliste.vergleichsliste_anzeigen === 'Y'}
        {navitem href="{get_static_route id='vergleichsliste.php'}" class="comparelist-nav-scrollbar-item nav-scrollbar-item"}
            <i class="fas fa-exchange-alt"></i>
            {lang key='compare'}
            {badge id="comparelist-badge" variant="primary" class="product-count ml-auto mr-0 align-center"}
                {count(JTL\Session\Frontend::getCompareList()->oArtikel_arr)}
            {/badge}
        {/navitem}
    {/if}
    {/block}

{if !$isMobile}

    {block name='snippets-categories-mega-categories-inner'}
        {foreach $categories as $category}
            {if isset($activeParents) && is_array($activeParents) && isset($activeParents[$i])}
                {assign var=activeParent value=$activeParents[$i]}
            {/if}
            {if $category->isOrphaned() === false}
                {if $category->hasChildren()}
                    {block name='snippets-categories-mega-category-child'}
                        <li class="nav-item nav-scrollbar-item dropdown dropdown-full
                            {if $Einstellungen.template.megamenu.show_categories === 'mobile'} d-lg-none
                            {elseif $Einstellungen.template.megamenu.show_categories === 'desktop'} d-none d-lg-inline-block {/if}
                            {if $category->getID() === $activeId
                        || (isset($activeParent)
                            && $activeParent->getID() === $category->getID())} active{/if}">
                            {link href=$category->getURL()
                                title=$category->getName()|escape:'html'
                                class="nav-link dropdown-toggle"
                                target="_self"
                                data=["category-id"=>$category->getID(), "cat-img-src"=>$category->imageURL, "cat-img-alt"=>$category->getName()]}
                                <span class="nav-mobile-heading">{$category->getShortName()}</span>
                            {/link}
                            <div class="dropdown-menu">
                                <div class="dropdown-body">
                                    {container class="subcategory-wrapper"}
                                        {row class="lg-row-lg nav"}
                                            {col lg=7 class="nav-item-lg-m nav-item dropdown"}
                                                {link href=$category->getURL() data=["cat-img-src"=>$category->imageURL, "cat-img-alt"=>$category->getName()]}
                                                    <strong class="h1 fw-bold pl-3 pt-3">{lang key='menuShow' printf=$category->getShortName()}</strong>
                                                {/link}
                                                <hr>
                                                <div class="subcat-scroller">
                                                    {block name='snippets-categories-mega-sub-categories'}
                                                        {if $category->hasChildren()}
                                                            {if !empty($category->getChildren())}
                                                                {assign var=sub_categories value=$category->getChildren()}
                                                            {else}
                                                                {get_category_array categoryId=$category->getID() assign='sub_categories'}
                                                            {/if}
                                                            {foreach $sub_categories as $sub}
                                                                {col lg=6 class="nav-item-lg-m nav-item {if $sub->hasChildren()}dropdown{/if}"}
                                                                    {block name='snippets-categories-mega-category-child-body-include-categories-mega-recursive'}
                                                                        {include file='snippets/categories_mega_recursive_desktop.tpl' mainCategory=$sub firstChild=true subCategory=$i + 1}
                                                                    {/block}
                                                                {/col}
                                                            {/foreach}
                                                        {/if}
                                                    {/block}
                                                </div>
                                            {/col}
                                            {col lg=5 class="bg-white cat-image"}
                                                <img src="" alt="" class="w-100 square">
                                            {/col}
                                            
                                        {/row}
                                    {/container}
                                </div>
                            </div>
                        </li>
                    {/block}
                {else}
                    {block name='snippets-categories-mega-category-no-child'}
                        {navitem href=$category->getURL() title=$category->getName()|escape:'html'
                            class="nav-scrollbar-item {if $Einstellungen.template.megamenu.show_categories === 'mobile'} d-lg-none
                                {elseif $Einstellungen.template.megamenu.show_categories === 'desktop'} d-none d-lg-inline-block {/if}
                                {if $category->getID() === $activeId}active{/if}"
                            data=["category-id"=>$category->getID()]}
                            <span class="text-truncate d-block">{$category->getShortName()}</span>
                        {/navitem}
                    {/block}
                {/if}
            {/if}
        {/foreach}
    {/block}
{/if}