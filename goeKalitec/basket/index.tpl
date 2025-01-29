{block name='basket-index-heading'}
    <h1 class="h2 basket-heading"><strong>{lang key='basket'}</strong> (<span class="text-primary">{count(JTL\Session\Frontend::getCart()->PositionenArr)}</span> {lang key='products'})</h1>
{/block}

{block name='basket-index-basket-xsell'}
    {if $isMobile}
        {card class='mr-n3 ml-n3 xsellcard border-0 mt-6 d-block d-lg-none' no-body=true}
       
            {block name='basket-index-xsell-available'}
                {cardheader class="bg-gray-lighter text-primary"}
                {block name='basket-index-xsell-heading'}
                    <strong class="font-size-lg" data-toggle="collapse" data-target="#xsell-card" id="xsm">{lang key='basketCustomerWhoBoughtXBoughtAlsoY'} <i class="fa fa-chevron-down fa15x"></i></strong>
                {/block}
                {/cardheader}
                {collapse id="xsell-card"}
                    {cardbody class="bg-gray-light"}
                    {block name='basket-index-include-product-slider'}
                        {include file='snippets/product_slider.tpl' productlist=$xselling->Kauf->Artikel title=$panelTitle tplscope="xselltop"}
                    {/block}
                    {/cardbody}
                {/collapse}
            {/block}

        {/card}
        {card class='mr-n3 ml-n3 xsellcard border-0 mt-6 d-none d-lg-block mb-6' no-body=true}
       
            {block name='basket-index-xsell-available-secondary'}
                {cardheader class="bg-gray-lighter text-primary"}
                {block name='basket-index-xsell-heading-secondary'}
                    <strong class="font-size-lg" data-toggle="collapse" data-target="#xsell-card-secondary" id="xsm">{lang key='basketCustomerWhoBoughtXBoughtAlsoY'} <i class="fa fa-chevron-down fa15x"></i></strong>
                {/block}
                {/cardheader}
                {collapse id="xsell-card-secondary"}
                    {cardbody class="bg-gray-light"}
                    {block name='basket-index-include-product-slider-secondary'}
                        {include file='snippets/product_slider.tpl' productlist=$xselling->Kauf->Artikel title=$panelTitle tplscope="xsellhalf"}
                    {/block}
                    {/cardbody}
                {/collapse}
            {/block}

        {/card}
        <hr class="mt-3 mb-3">
    {else}
        {lang key='basketCustomerWhoBoughtXBoughtAlsoY' assign='panelTitle'}
        {block name='basket-index-include-product-slider'}
            {include file='snippets/product_slider.tpl' productlist=$xselling->Kauf->Artikel title=$panelTitle tplscope="xselltop"}
        {/block}
    {/if}
{/block}

{if $isMobile}
    {block name='basket-index-freegifts-heading'}
        
    {/block}
{else}
    {block name='basket-index-freegifts-heading'}
        {if $selectedFreegift === 0}
            <div class="h2 basket-heading hr-sect"><i class="fas fa-gift text-success"></i>&nbsp;{lang key='freeGiftFromOrderValueBasket'}</div>
        {else}
            <div class="h2 basket-heading hr-sect">{lang key="giftChange" section="custom"}</div>
        {/if}
    {/block}
{/if}

{block name='basket-index-freegifts'}
 
    {if $isMobile}
        
        <div class="{if $selectedFreegift === 0}{else}d-none{/if} freegift-float p-2 text-center">
            <a class="h2 text-white mb-0" href="#geschenk">
            {if $selectedFreegift === 0}
                <i class="fas fa-gift"></i> {lang key="giftAvailable" section="custom"}
            {else}
                <i class="fas fa-check"></i> {lang key="giftSelected" section="custom"}
            {/if}
            </a>
        </div>
        {card class='card-gray' no-body=true}
       
            {block name='basket-index-coupon-available'}
                {cardheader}
                {block name='basket-index-coupon-heading'}
                    <strong class="font-size-lg" data-toggle="collapse" data-target="#freegift-card" id="geschenk">
                        {if $selectedFreegift === 0}
                            <i class="fas fa-gift text-success"></i> {lang key='freeGiftFromOrderValueBasket'}
                        {else}
                            <i class="fas fa-check"></i> {lang key="giftChange" section="custom"}
                        {/if}
                        
                    </strong>
                {/block}
                {/cardheader}
                {collapse id="freegift-card"}
                    {cardbody}
                    {block name='basket-index-freegift-card'}
                        {row id="freegift"
                        class="slick-smooth-loading carousel carousel-arrows-inside slick-lazy pb-3 slick-type-half{$additional}"
                        data=["slick-type"=>"slider-half"]}
                            {include file='snippets/slider_items.tpl' items=$oArtikelGeschenk_arr type='freegift'}
                        
                        {/row}
                    {/block}
                    {/cardbody}
                {/collapse}
            {/block}

        {/card}
    {else}
        {lang key='freeGiftFromOrderValueBasket' assign='panelTitle'}
        {row id="freegift"
        class="slick-smooth-loading carousel carousel-arrows-inside slick-lazy slick-type-half{$additional}"
        data=["slick-type"=>"slider-half"]}
            {include file='snippets/slider_items.tpl' items=$oArtikelGeschenk_arr type='freegift'}
        
        {/row}
    {/if}
{/block}

{block name='basket-index-form-shipping-calc'}
   {*hidden*}
{/block}