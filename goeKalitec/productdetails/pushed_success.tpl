{block name='productdetails-pushed-success'}
<div class="push-aligner">
    <div id="pushed-success" {if $card}role="alert" class="border-0 modal d-block fade show pushedModal card alert alert-dismissable"{/if}>
        {if isset($zuletztInWarenkorbGelegterArtikel)}
            {assign var=pushedArtikel value=$zuletztInWarenkorbGelegterArtikel}
        {else}
            {assign var=pushedArtikel value=$Artikel}
        {/if}
        {assign var=showXSellingCart value=isset($Xselling->Kauf) && count($Xselling->Kauf->Artikel) > 0}
        {if $card}
            {block name='productdetails-pushed-success-cart-note-heading'}
                <div class="card-header alert-success">
                    {if isset($cartNote)}
                        {$cartNote}
                    {/if}
                </div>
            {/block}
            <div class="card-body">
        {/if}

        {row}
            {block name='productdetails-pushed-success-product-cell'}
                {col cols=12 md=12}
                    {block name='productdetails-pushed-success-product-cell-content'}
                        <div class="productbox-inner{if isset($class)} {$class}{/if}">
                            {row}
                                {col cols=12 md=12 class="pushed-success-image-wrapper"}
                                    {block name='productdetails-pushed-success-product-cell-image'}
                                        {include file='snippets/image.tpl'
                                            item=$pushedArtikel
                                            square=false
                                            class='image'
                                            srcSize='sm'}
                                    {/block}
                                {/col}
                                {col cols=12}
                                    {block name='productdetails-pushed-success-product-cell-subheading'}
                                        <div class="subheadline h3 fw-bold">{$pushedArtikel->cName}</div>
                                    {/block}
                                {/col}
                                {col cols=12 md=12}
                                {block name='productdetails-pushed-success-product-cell-details'}
                                    {row}
                                        {col cols=12}
                                            <dl class="form-row">
                                                <dt class="col-5">{lang key='productNo'}:</dt>
                                                <dd class="col-7">{$pushedArtikel->cArtNr}</dd>
                                                {if !empty($pushedArtikel->cHersteller)}
                                                    <dt class="col-5">{lang key='manufacturer' section='productDetails'}:</dt>
                                                    <dd class="col-7">{$pushedArtikel->cHersteller}</dd>
                                                {/if}
                                                
                                                {block name='productdetails-pushed-success-mhd'}
                                                    {if  $Einstellungen.artikeldetails.show_shelf_life_expiration_date === 'Y'
                                                    && isset($pushedArtikel->dMHD)
                                                    && isset($pushedArtikel->dMHD_de)}
                                                        <dt class="col-5">{lang key='productMHDTool'}:</dt>
                                                        <dd class="col-7">{$pushedArtikel->dMHD_de}</dd>
                                                    {/if}
                                                {/block}
                                                
                                            </dl>
                                        {/col}
                                    {/row}
                                {/block}
                                
                                {/col}
                            {/row}
                        </div>
                    {/block}
                    {block name='productdetails-pushed-success-product-cell-links'}
                        {row class="pushed-success-buttons"}
                            {col cols=12 md=12}
                                {$lastVisitedProductListURL = $smarty.session.lastVisitedProductListURL|default:$cCanonicalURL}
                                {$productID = $pushedArtikel->kArtikel}
                                {if $pushedArtikel->kVaterArtikel > 0}
                                    {$productID = $pushedArtikel->kVaterArtikel}
                                {/if}
                                {link href=$lastVisitedProductListURL|cat:'#buy_form_'|cat:$productID class="btn btn-outline-primary btn-block  text-uppercase fw-bolder continue-shopping  d-flex align-center justify-content-center"
                                    data=["dismiss"=>"{if !$card}modal{/if}"]
                                    aria=["label"=>"Close"]}
                                    <i class="fa fa-arrow-circle-left fa15x"></i><span>&nbsp;{lang key='continueShopping' section='checkout'}</span>
                                {/link}
                            {/col}
                            {col cols=12 md=12}
                                {link href="{get_static_route id='warenkorb.php'}"
                                    class="btn btn-primary btn-basket btn-block text-uppercase fw-bolder d-flex align-center justify-content-center"}
                                    <i class="fas fa-shopping-cart fa15x"></i> <span>&nbsp;{lang key='gotoBasket'}</span>
                                {/link}
                            {/col}
                        {/row}
                    {/block}
                {/col}
            {/block}
            {block name='productdetails-pushed-success-x-sell'}
            
            {/block}
        {/row}
        {if $card}</div>{/if}
    </div>
</div>

{/block}
