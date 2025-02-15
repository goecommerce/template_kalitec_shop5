{block name='snippets-categories-mega-recursive'}
    {block name='snippets-categories-mega-recursive-max-subsub-items'}
        {$max_subsub_items="{if $isMobile}5{else}2{/if}"}
    {/block}
    {block name='snippets-categories-mega-recursive-main-link'}
        {link href=$mainCategory->getURL()
            class="categories-recursive-link d-lg-block {if $firstChild}submenu-headline submenu-headline-toplevel{/if} {$subCategory} {if $mainCategory->hasChildren() && $subCategory < $max_subsub_items && $Einstellungen.template.megamenu.show_subcategories !== 'N'}nav-link dropdown-toggle{/if}"
            aria=["expanded"=>"false"]
            data=["category-id"=>$mainCategory->getID(), "cat-img-src"=>$mainCategory->imageURL, "cat-img-alt"=>$mainCategory->getName()]}
            <span class="text-truncate d-block">
                {$mainCategory->getShortName()}{if $mainCategory->hasChildren() && $subCategory >= $max_subsub_items}<span class="more-subcategories">&nbsp;({$mainCategory->getChildren()|count})</span>{/if}
            </span>
        {/link}
    {/block}
    {if $mainCategory->hasChildren() && $Einstellungen.template.megamenu.show_subcategories !== 'N' && $subCategory < $max_subsub_items}
        {block name='snippets-categories-mega-recursive-child-content'}
            <div class="categories-recursive-dropdown dropdown-menu is-desktop">
                {nav}
                    {block name='snippets-categories-mega-recursive-child-header'}
                        {$imgAlt = $mainCategory->getAttribute('img_alt')}
                        
                        <li class="nav-item d-lg-none" data-cat-img-src="{$mainCategory->imageURL}" data-cat-img-alt="{if empty($imgAlt->cWert)}{$mainCategory->getName()|escape:'html'}{else}{$imgAlt->cWert}{/if}">
                            {link href=$mainCategory->getURL()}
                                <strong class="nav-mobile-heading">
                                    {lang key='menuShow' printf=$mainCategory->getShortName()}
                                </strong>
                            {/link}
                        </li>
                    {/block}
                    {block name='snippets-categories-mega-recursive-child-categories'}
                        {foreach $mainCategory->getChildren() as $category}
                            {if $category->hasChildren() && $subCategory + 1 < $max_subsub_items}
                                {block name='snippets-categories-mega-recursive-child-category-child'}
                                    <li class="nav-item dropdown" data-cat-img-src="{$mainCategory->imageURL}" data-cat-img-alt="{if empty($imgAlt->cWert)}{$mainCategory->getName()|escape:'html'}{else}{$imgAlt->cWert}{/if}">
                                        {include file='snippets/categories_mega_recursive.tpl' mainCategory=$category firstChild=false subCategory=$subCategory + 1}
                                    </li>
                                {/block}
                            {else}
                                {block name='snippets-categories-mega-recursivechild-category-no-child'}
                                    {navitem href=$category->getURL() data=["category-id"=>$category->getID()]}
                                        <span class="text-truncate d-block">
                                            {$category->getShortName()}{if $category->hasChildren()}<span class="more-subcategories">&nbsp;({$category->getChildren()|count})</span>{/if}
                                        </span>
                                    {/navitem}
                                {/block}
                            {/if}
                        {/foreach}
                    {/block}
                {/nav}
            </div>
        {/block}
    {/if}
{/block}
