{block name='productdetails-price-detail-bulk-price'}
    {if $tplscope === "detail"}
    {else}
    <button class="mt-3 d-block w-100 btn btn-outline-primary p-1 btn-sm" type="button" data-toggle="collapse" data-target="#collapseBulk" aria-expanded="false" aria-controls="collapseBulk">
        <i class="fas fa-file"></i> Staffelpreise
    </button>
    <div class="collapse" id="collapseBulk">
        <div class="card card-body p-0">
            <div class="bulk-prices mt-0">
                <table class="table table-sm table-hover mb-0">
                        <thead>
                            {block name='productdetails-price-detail-bulk-price-head'}
                                <tr>
                                    <th>
                                        {lang key='fromDifferential' section='productOverview'}
                                    </th>
                                    <th>{lang key='pricePerUnit' section='productDetails'}{if $Artikel->cEinheit} / {$Artikel->cEinheit}{/if}
                                        {if isset($Artikel->cMasseinheitName) && isset($Artikel->fMassMenge) && $Artikel->fMassMenge > 0 && $Artikel->cTeilbar !== 'Y' && ($Artikel->fAbnahmeintervall == 0 || $Artikel->fAbnahmeintervall == 1) && isset($Artikel->cMassMenge)}
                                            ({$Artikel->cMassMenge} {$Artikel->cMasseinheitName})
                                        {/if}
                                    </th>
                                    {if !empty($Artikel->staffelPreis_arr[0].cBasePriceLocalized)}
                                    <th>
                                        {lang key='basePrice'}
                                    </th>
                                    {/if}
                                </tr>
                            {/block}
                        </thead>
                        <tbody>
                            {block name='productdetails-price-detail-bulk-price-body'}
                                {foreach $Artikel->staffelPreis_arr as $bulkPrice}
                                    {if $bulkPrice.nAnzahl > 0}
                                        <tr class="bulk-price-{$bulkPrice.nAnzahl}">
                                            <td>{$bulkPrice.nAnzahl}</td>
                                            <td>
                                                <span class="bulk-price">{$bulkPrice.cPreisLocalized[$NettoPreise]}</span><span class="footnote-reference">*</span>
                                            </td>
                                            {if !empty($bulkPrice.cBasePriceLocalized)}
                                                <td class="bulk-base-price">
                                                    {$bulkPrice.cBasePriceLocalized[$NettoPreise]}
                                                </td>
                                            {/if}
                                        </tr>
                                    {/if}
                                {/foreach}
                            {/block}
                        </tbody>
                    </table>
                </div>{* /bulk-price *}
        </div>
    </div>
    {/if}
    
{/block}

{block name='productdetails-price-detail' prepend}
   
    <div class="d-block text-dark netto-hook pt-2">
        <div id="nettoSwitcher-detail" class="text-decoration-underline">Nettopreise anzeigen</div>
    </div>
  
{/block}
