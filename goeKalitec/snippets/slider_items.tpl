{block name='snippets-slider-items-product'}
    <div class="kalitec product-wrapper product-wrapper-product text-center-util {if $item@first && $item@last} m-auto{elseif $item@first} ml-auto-util {elseif $item@last} mr-auto {/if}{if isset($style)} {$style}{/if}" {if $tplscope !== 'box'}{if isset($Link) && $Link->getLinkType() === $smarty.const.LINKTYP_STARTSEITE || $nSeitenTyp === $smarty.const.PAGE_ARTIKELLISTE}itemprop="about"{else}itemprop="isRelatedTo"{/if} itemscope itemtype="https://schema.org/Product"{/if}>
        {include file='productlist/item_box.tpl' Artikel=$item tplscope=$tplscope}
    </div>
{/block}