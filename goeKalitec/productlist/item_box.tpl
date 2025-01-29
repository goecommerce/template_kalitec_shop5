
{block name='productlist-item-box-caption' append}
    
    {block name='productlist-item-list-basket-details'}
        {if !$isOPC}
        <div class="form-row productbox-onhover productbox-actions item-list-basket-details">
            {if ($Artikel->inWarenkorbLegbar === 1
                    || ($Artikel->nErscheinendesProdukt === 1 && $Einstellungen.global.global_erscheinende_kaeuflich === 'Y'))
                && (($Artikel->nIstVater === 0 && $Artikel->Variationen|count === 0)
                    || $hasOnlyListableVariations === 1)
                && !$Artikel->bHasKonfig
                && $Einstellungen.template.productlist.buy_productlist === 'Y'}
                {if $Artikel->nIstVater && $Artikel->kVaterArtikel == 0}
                    {col cols=12}
                        {block name='productlist-item-list-basket-details-variations'}
                            {alert variation="info" class="choose-variations text-left-util"}
                                {lang key='chooseVariations' section='messages'}
                            {/alert}
                        {/block}
                    {/col}
                {else}
                    {row class="justify-content-between pr-3"}
                        {col cols=3 class="btn-sqrd pr-0"}
                            {link class="btn btn-outline-primary btn-block" role="button" href=$Artikel->cURLFull}
                                <span class="monospace fa15x">i</span>
                            {/link}
                        {/col}
                        {col cols=9}
                            {row class="justify-content-end"}
                                {col cols=9 class="pl-0 pr-2"}
                                    {block name='productlist-item-list-basket-details-quantity'}
                                        {inputgroup class="form-counter" data=["bulk" => {!empty($Artikel->staffelPreis_arr)}]}
                                            {inputgroupprepend}
                                                {button variant=""
                                                    data=["count-down"=>""]
                                                    aria=["label"=>{lang key='decreaseQuantity' section='aria'}]}
                                                    <span class="fas fa-minus"></span>
                                                {/button}
                                            {/inputgroupprepend}
                                            {input type="number" min="0"
                                                step="{if $Artikel->cTeilbar === 'Y' && $Artikel->fAbnahmeintervall == 0}any{elseif $Artikel->fAbnahmeintervall > 0}{$Artikel->fAbnahmeintervall}{else}1{/if}"
                                                min="{if $Artikel->fMindestbestellmenge}{$Artikel->fMindestbestellmenge}{else}0{/if}"
                                                max=$Artikel->FunktionsAttribute[$smarty.const.FKT_ATTRIBUT_MAXBESTELLMENGE]|default:''
                                                id="{$idPrefix|default:''}quantity{$Artikel->kArtikel}"
                                                class="quantity bg-gray-lighter"
                                                name="anzahl"
                                                autocomplete="off"
                                                aria=["label"=>{lang key='quantity'}]
                                                data=[
                                                    "decimals"=>{getDecimalLength quantity=$Artikel->fAbnahmeintervall},
                                                    "product-id"=>"{if isset($Artikel->kVariKindArtikel)}{$Artikel->kVariKindArtikel}{else}{$Artikel->kArtikel}{/if}"
                                                ]
                                                value="{if $Artikel->fAbnahmeintervall > 0 || $Artikel->fMindestbestellmenge > 1}{if $Artikel->fMindestbestellmenge > $Artikel->fAbnahmeintervall}{$Artikel->fMindestbestellmenge}{else}{$Artikel->fAbnahmeintervall}{/if}{else}1{/if}"}
                                            {inputgroupappend}
                                                {button variant=""
                                                    data=["count-up"=>""]
                                                    aria=["label"=>{lang key='increaseQuantity' section='aria'}]}
                                                    <span class="fas fa-plus"></span>
                                                {/button}
                                            {/inputgroupappend}
                                        {/inputgroup}
                                    {/block}
                                {/col}
                                {col cols=3 class="pl-0 pr-0 btn-sqrd"}
                                    {block name='productlist-item-list-basket-details-add-to-cart'}
                                        {button type="submit"
                                            variant="primary"
                                            block=true id="{$idPrefix|default:''}submit{$Artikel->kArtikel}"
                                            title="{lang key='addToCart'}"
                                            class="basket-details-add-to-cart m-0"
                                            aria=["label"=>{lang key='addToCart'}]}
                                            {*lang key='addToCart'*} <span class="fas fa-shopping-bag fa2x"></span>
                                        {/button}
                                    {/block}
                                {/col}
                            {/row}
                        {/col}
                    {/row}
                {/if}
            {else}
                {col cols=12}
                    {block name='productlist-item-list-basket-details-details'}
                        {link class="btn btn-outline-primary btn-block" role="button" href=$Artikel->cURLFull}
                            {lang key='details'}
                        {/link}
                    {/block}
                {/col}
            {/if}
        </div>
        {/if}
    {/block}
    {block name='productlist-item-form-expandable-inputs-hidden'}
        {if $Artikel->kArtikelVariKombi > 0}
            {input type="hidden" name="aK" value=$Artikel->kArtikelVariKombi}
        {/if}
        {if isset($Artikel->kVariKindArtikel)}
            {input type="hidden" name="VariKindArtikel" value=$Artikel->kVariKindArtikel}
        {/if}
        {input type="hidden" name="a" value=$Artikel->kArtikel}
        {input type="hidden" name="wke" value="1"}
        {input type="hidden" name="overview" value="1"}
        {input type="hidden" name="Sortierung" value="{if !empty($Suchergebnisse->Sortierung)}{$Suchergebnisse->Sortierung}{/if}"}
        {if $Suchergebnisse->getPages()->getCurrentPage() > 1}
            {input type="hidden" name="seite" value=$Suchergebnisse->getPages()->getCurrentPage()}
        {/if}
        {if $NaviFilter->hasCategory()}
            {input type="hidden" name="k" value=$NaviFilter->getCategory()->getValue()}
        {/if}
        {if $NaviFilter->hasManufacturer()}
            {input type="hidden" name="h" value=$NaviFilter->getManufacturer()->getValue()}
        {/if}
        {if $NaviFilter->hasSearchQuery()}
            {input type="hidden" name="l" value=$NaviFilter->getSearchQuery()->getValue()}
        {/if}
        {if $NaviFilter->hasCharacteristicValue()}
            {input type="hidden" name="m" value=$NaviFilter->getCharacteristicValue()->getValue()}
        {/if}
        {if $NaviFilter->hasCategoryFilter()}
            {assign var=cfv value=$NaviFilter->getCategoryFilter()->getValue()}
            {if is_array($cfv)}
                {foreach $cfv as $val}
                    {input type="hidden" name="hf" value=$val}
                {/foreach}
            {else}
                {input type="hidden" name="kf" value=$cfv}
            {/if}
        {/if}
        {if $NaviFilter->hasManufacturerFilter()}
            {assign var=mfv value=$NaviFilter->getManufacturerFilter()->getValue()}
            {if is_array($mfv)}
                {foreach $mfv as $val}
                    {input type="hidden" name="hf" value=$val}
                {/foreach}
            {else}
                {input type="hidden" name="hf" value=$mfv}
            {/if}
        {/if}
        {foreach $NaviFilter->getCharacteristicFilter() as $filter}
            {input type="hidden" name="mf{$filter@iteration}" value=$filter->getValue()}
        {/foreach}
    {/block}
{/block}
               