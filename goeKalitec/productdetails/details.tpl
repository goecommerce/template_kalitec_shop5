{block name='productdetails-details-info-product-title'}
{/block}

{block name='productdetails-details-info-essential'}
{/block}

{block name='productdetails-details-info-description-wrapper'}
{/block}


{block name='productdetails-details-include-image'}
    {block name='productdetails-details-info-product-title-inner'}
        {row class="w-100"}
            {col cols=12}
                {opcMountPoint id='opc_before_headline'}
                <h1 class="text-dark product-title h2" itemprop="name">{$Artikel->cName}</h1>
            {/col}
        {/row}
    {/block}

    {col cols=12 lg=9 class="product-gallery"}
        {opcMountPoint id='opc_before_gallery'}
        {row class="bg-white"}
            {col cols=12 md=6}
                
                {include file='productdetails/image.tpl'}

                {block name='productlist-item-list-include-searchspecials-detail'}
                    {if $Artikel->Bilder|count > 1}
                        <div class="ribbon-after-gallery">
                    {/if}
                        {include file='snippets/ribbon.tpl'}
                    {if $Artikel->Bilder|count > 1}
                        </div>
                    {/if}
                {/block}

            {/col}
            {col cols=12 md=6 class="pt-3"}
                {if $Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen !== 'N' && isset($Artikel->cHersteller) && !empty($Artikel->cHersteller)}
                    {block name='productdetails-details-product-info-manufacturer-upper'}
                        <div class="product-manufacturer-image {if !empty($Artikel->cHerstellerBildURLKlein)}mb-3{/if}" itemprop="brand" itemscope itemtype="https://schema.org/Brand">
                            {if $Einstellungen.artikeldetails.artikel_weitere_artikel_hersteller_anzeigen === 'Y'}
                                <a href="{if !empty($Artikel->cHerstellerHomepage)}{$Artikel->cHerstellerHomepage}{else}{$Artikel->cHerstellerURL}{/if}"
                                    {if $Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen === 'B'}
                                        data-toggle="tooltip"
                                        data-placement="left"
                                        title="{$Artikel->cHersteller}"
                                    {/if}
                                itemprop="url">
                            {/if}
                                {if !empty($Artikel->cHerstellerBildURLKlein)}
                                    {image lazy=true
                                        webp=true
                                        class="man-img"
                                        src=$Artikel->cHerstellerBildURLKlein
                                        alt=$Artikel->cHersteller|escape:'html'
                                    }
                                    <meta itemprop="image" content="{$Artikel->cHerstellerBildURLKlein}">
                                {/if}
                                {if $Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen !== 'B'}
                                    <span itemprop="name" class="d-none">{$Artikel->cHersteller}</span>
                                {/if}
                            {if $Einstellungen.artikeldetails.artikel_weitere_artikel_hersteller_anzeigen === 'Y'}
                                </a>
                            {/if}
                        </div>
                    {/block}
                {/if}
                {*if isset($Artikel->cArtNr)}
                    <p class="small"><span itemprop="sku">{lang key="articleNumber" section="custom"}: {$Artikel->cArtNr}</span></p>
                {/if*}

                {block name='productdetails-details-info-description-wrapper-inner'}
                    {if $Einstellungen.artikeldetails.artikeldetails_kurzbeschreibung_anzeigen === 'Y' && $Artikel->cKurzBeschreibung}
                        {block name='productdetails-details-info-description'}
                            {opcMountPoint id='opc_before_short_desc'}
                            <div class="shortdesc" itemprop="description">
                                {$Artikel->cKurzBeschreibung}
                            </div>
                        {/block}
                    {/if}
                    {opcMountPoint id='opc_after_short_desc'}
                {/block}

            {/col}
        {/row}
        {opcMountPoint id='opc_after_gallery'}
    {/col}
{/block}

{* sliders *}
{$tplscope = "detail"}
{block name='productdetails-details-include-product-slider-partslist'}
    <div class="partslist">
        {lang key='listOfItems' section='global' assign='slidertitle'}
        {include file='snippets/product_slider.tpl' id='slider-partslist' productlist=$Artikel->oStueckliste_arr title=$slidertitle showPartsList=true tplscope=$tplscope}
    </div>
{/block}

{block name='productdetails-details-recommendations'}

    {if isset($Xselling->Standard->XSellGruppen) && count($Xselling->Standard->XSellGruppen) > 0}
        {foreach $Xselling->Standard->XSellGruppen as $Gruppe}
            
            {include file='snippets/product_slider.tpl' class='x-supplies' id='slider-xsell-group-'|cat:$Gruppe@iteration productlist=$Gruppe->Artikel title=$Gruppe->Name tplscope=$tplscope}
        {/foreach}
    {/if}

    {if isset($Xselling->Kauf->Artikel) && count($Xselling->Kauf->Artikel) > 0}
        {lang key='customerWhoBoughtXBoughtAlsoY' section='productDetails' assign='slidertitle'}
        {include file='snippets/product_slider.tpl' class='x-sell' id='slider-xsell' productlist=$Xselling->Kauf->Artikel title=$slidertitle tplscope=$tplscope}
    {/if}

    {if isset($oAehnlicheArtikel_arr) && count($oAehnlicheArtikel_arr) > 0}
        {lang key='RelatedProducts' section='productDetails' assign='slidertitle'}
        {include file='snippets/product_slider.tpl' class='x-related' id='slider-related' productlist=$oAehnlicheArtikel_arr title=$slidertitle tplscope=$tplscope}
    {/if}
{/block}

{block name='productdetails-details-include-basket'}
    <div class="basket-whole-wrapper">
    {if empty($smarty.get.quickView)}
        {include file='productdetails/basket.tpl'}
    {/if}
    <div id="paypal-buttons-detail">
    </div>

    
    <div id="individual-prices" class="text-center {if isset($Artikel->Preise->Kundenpreis_aktiv) && $Artikel->Preise->Kundenpreis_aktiv == 1}{else}{if JTL\Session\Frontend::getCustomer()->getID() === 0}logged-out{else}no-prices{/if}{/if}">
        {if JTL\Session\Frontend::getCustomer()->getID() === 0}
            <span id="individual-prices-modal" data-toggle="modal" data-target="#priceLoginModal" class="align-center d-flex justify-content-center btn btn-default bg-gray-lighter text-dark"><i class="fas fa-tag fa15x"></i> <span>{lang key="individualPrices" section="custom"}</span></span>
        {else}
            <span id="individual-prices" class="align-center d-flex justify-content-center btn btn-default bg-gray-lighter text-dark"><i class="fas fa-tag fa15x"></i> <span>{lang key="individualPrices" section="custom"}</span></span>
        {/if}
    </div>


    {* --- Staffelpreise? --- *}
    {if !empty($Artikel->staffelPreis_arr) && $tplscope === "detail"}
        {block name='productdetails-price-detail-bulk-price-outer'}
            <p class="text-dark pt-3"><strong>{lang key="differentialPrices" section="custom"}:</strong></p>
            <div class="bulk-prices text-dark">
                <table class="table table-sm table-hover text-dark bulktable">
                    
                    <tbody>
                        {block name='productdetails-price-detail-bulk-price-body'}
                            {* view UNTIL first Bulkprice reached *}
                            {if isset($Artikel->staffelPreis_arr[0])}
                                {assign var="bulkPrice" value=$Artikel->staffelPreis_arr[0]}
                                {math equation="x - y" x=$bulkPrice.nAnzahl y=1 assign="nonBulkCount"}
                                <tr class="bulk-price-{$bulkPrice.nAnzahl}">
                                    <td class="pl-0">{lang key="trustedShopsTo" section="global"} {$nonBulkCount}</td>
                                    <td class="text-right pr-0">
                                        <span class="bulk-price">{$Artikel->Preise->cVKLocalized[$NettoPreise]}</span><span class="footnote-reference">*</span> / {$Artikel->cEinheit}
                                    </td>
                                </tr>
                            {/if}
                            {* view UNTIL first Bulkprice reached end *}
                            {foreach $Artikel->staffelPreis_arr as $bulkPrice}
                                {if $bulkPrice.nAnzahl > 0}
                                    <tr class="bulk-price-{$bulkPrice.nAnzahl}">
                                        <td class="pl-0">{lang key="from" section="productOverview"} {$bulkPrice.nAnzahl}</td>
                                        <td class="text-right pr-0">
                                            <span class="bulk-price">{$bulkPrice.cPreisLocalized[$NettoPreise]}</span><span class="footnote-reference">*</span> / {$Artikel->cEinheit}
                                        </td>
                                        {if !empty($bulkPrice.cBasePriceLocalized)}
                                            <td class="bulk-base-price text-right pr-0">
                                                {$bulkPrice.cBasePriceLocalized[$NettoPreise]} / {$Artikel->cEinheit}
                                            </td>
                                        {/if}
                                    </tr>
                                {/if}
                            {/foreach}
                        {/block}
                    </tbody>
                </table>
            </div>{* /bulk-price *}
        {/block}
    {/if}
    </div>
{/block}


{block name='productdetails-details-include-tabs' append}
    {block name="user-login-modal-prices"}
        {if JTL\Session\Frontend::getCustomer()->getID() === 0}
        <!-- Modal Kundenpreise-->
        <div class="modal fade" id="priceLoginModal" tabindex="-1" aria-labelledby="priceLoginModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                    <h5 class="modal-title" id="priceLoginModalLabel">{lang key="individualPricesHead" section="custom"}</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    </div>
                    <div class="modal-body">
                        {form action="{get_static_route id='jtl.php' secure=true}" method="post" class="jtl-validate" slide=true}
                            {block name='layout-header-shop-nav-account-form-content-prices'}
                                <fieldset id="quick-login">
                                    {block name='layout-header-nav-account-form-email-prices'}
                                        {formgroup label-for="email_quick" label={lang key='emailadress'}}
                                            {input type="email" name="email" id="email_quick" size-class="sm"
                                                placeholder=" " required=true
                                                autocomplete="email"}
                                        {/formgroup}
                                    {/block}
                                    {block name='layout-header-nav-account-form-password-prices'}
                                        {formgroup label-for="password_quick" label={lang key='password'} class="account-icon-dropdown-pass"}
                                            {input type="password" name="passwort" id="password_quick" size-class="sm"
                                                required=true placeholder=" "
                                                autocomplete="current-password"}
                                        {/formgroup}
                                    {/block}
                                    {block name='layout-header-nav-account-form-captcha-prices'}
                                        {if isset($showLoginCaptcha) && $showLoginCaptcha}
                                            {formgroup class="simple-captcha-wrapper"}
                                                {captchaMarkup getBody=true}
                                            {/formgroup}
                                        {/if}
                                    {/block}
                                    {block name='layout-header-shop-nav-account-form-submit-prices'}
                                        {formgroup}
                                            {input type="hidden" name="login" value="1"}
                                            {if !empty($oRedirect->cURL)}
                                                {foreach $oRedirect->oParameter_arr as $oParameter}
                                                    {input type="hidden" name=$oParameter->Name value=$oParameter->Wert}
                                                {/foreach}
                                                {input type="hidden" name="r" value=$oRedirect->nRedirect}
                                                {input type="hidden" name="cURL" value=$oRedirect->cURL}
                                            {/if}
                                            {button type="submit" size="sm" id="submit-btn" block=true variant="primary"}{lang key='login'}{/button}
                                        {/formgroup}
                                    {/block}
                                    
                                </fieldset>
                            {/block}
                        {/form}
                        {block name='layout-header-nav-account-link-forgot-password-prices'}
                            {link href="{get_static_route id='pass.php'}" rel="nofollow" title="{lang key='forgotPassword'}"}
                                {lang key='forgotPassword'}
                            {/link}
                        {/block}
                    </div>
                </div>
            </div>
        </div>
    {/if}
    {/block}
{/block}