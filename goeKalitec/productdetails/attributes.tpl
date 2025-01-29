{block name='productdetails-attributes-table' prepend}
    <p class="h3 text-dark">{lang key="technicalData" section="custom"}</p>
        
        {if !$isMobile && !$isTablet}
            {if !empty($Artikel->oMedienDatei_arr)}
                <div class="order-6">
                {foreach $Artikel->oMedienDatei_arr as $oMedienDatei}
                    {if $oMedienDatei->nMedienTyp == 5}
                        {if $oMedienDatei@first}
                            <p class="h3 text-dark pt-3 mt-3">{lang key="downloads"}</p>
                        {/if}
                        {block name='productdetails-mediafile-pdf-attributes'}
                            {card class="mediafiles-pdf mb-3"}
                               
                                
                                    {col cols=12 class="pr-2 pl-2"}
                                    
                                        {if !empty($oMedienDatei->cPfad)}
                                            {link class="text-decoration-none-util align-center text-decoration-none d-flex" 
                                                href="{$ShopURL}/{$smarty.const.PFAD_MEDIAFILES}{$oMedienDatei->cPfad}"
                                                target="_blank"
                                            }
                                                <i class="fas fa-file-pdf fa2x"></i>
                                                <span class="pl-1"><b>{$oMedienDatei->cName}</b><br><small>({$oMedienDatei->cMedienTyp})</small></span>
                                            {/link}
                                        {elseif !empty($oMedienDatei->cURL)}
                                            {link class="text-decoration-none-util align-center text-decoration-none d-flex " href=$oMedienDatei->cURL target="_blank"}
                                                <i class="fas fa-file-pdf fa2x"></i>
                                                <span class="pl-1"><b>{$oMedienDatei->cName}</b><br><small>({$oMedienDatei->cMedienTyp})</small></span>
                                            {/link}
                                        {/if}
                                        <div class="d-none">
                                            {$oMedienDatei->cBeschreibung}
                                        </div>
                                    {/col}
                               
                            {/card}
                        {/block}
                    {/if}
                {/foreach}
                </div>
            {/if}
        {/if}
{/block}

{block name='productdetails-attributes-characteristics' prepend}
    
    {if isset($Artikel->cArtNr)}
        <tr>
            <td class="h6" title="{lang key="articleNumber" section="custom"}">
                {lang key="articleNumber" section="custom"}:
            </td>
            <td class="attr-characteristic" itemprop="sku">{$Artikel->cArtNr}</td>
        </tr>
    {/if}

    {if $Einstellungen.artikeldetails.show_shelf_life_expiration_date === 'Y'
    && isset($Artikel->dMHD)
    && isset($Artikel->dMHD_de)}
        <tr>
            <td class="h6" title="{lang key='productMHDTool'}">
                {lang key='productMHD'}:
            </td>
            <td class="attr-characteristic" itemprop="best-before">{$Artikel->dMHD_de}</td>
        </tr>
    {/if}

    {if !empty($Artikel->cBarcode)
    && ($Einstellungen.artikeldetails.gtin_display === 'details'
    || $Einstellungen.artikeldetails.gtin_display === 'always')}
        <tr>
            <td class="h6">{lang key='ean'}:</td>
            <td class="attr-characteristic" itemprop="{if $Artikel->cBarcode|strlen === 8}gtin8{else}gtin13{/if}">{$Artikel->cBarcode}</td>
        </tr>
    {/if}

    {if !empty($Artikel->cHAN)
    && ($Einstellungen.artikeldetails.han_display === 'details'
    || $Einstellungen.artikeldetails.han_display === 'always')}
        <tr>
            <td class="h6">{lang key='han'}:</td>
            <td class="attr-characteristic" itemprop="">{$Artikel->cHAN}</td>
        </tr>
    {/if}

    {if !empty($Artikel->cISBN)
    && ($Einstellungen.artikeldetails.isbn_display === 'D'
    || $Einstellungen.artikeldetails.isbn_display === 'DL')}
        <tr>
            <td class="h6">{lang key='isbn'}:</td>
            <td class="attr-characteristic" itemprop="gtin13">{$Artikel->cISBN}</td>
        </tr>
    {/if}

    {assign var=cidx value=($Brotnavi|count)-2}
    {if $Einstellungen.artikeldetails.artikeldetails_kategorie_anzeigen === 'Y' && isset($Brotnavi[$cidx])}
    
        <tr>
            <td class="h6">{lang key='category'}:</td>
            <td class="attr-characteristic">
                <a href="{$Brotnavi[$cidx]->getURLFull()}" itemprop="category"
                    {if !empty($smarty.get.quickView)}target="_blank"{/if}
                >
                    {$Brotnavi[$cidx]->getName()}
                </a>
            </td>
        </tr>
    
    {/if}

    {if $Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen !== 'N' && isset($Artikel->cHersteller)}
      
            <tr itemprop="brand" itemscope itemtype="https://schema.org/Brand">
                <td class="h6">{lang key='manufacturers'}:</td>
                <td class="attr-characteristic">
                    {if $Einstellungen.artikeldetails.artikel_weitere_artikel_hersteller_anzeigen === 'Y'}
                        <a href="{if !empty($Artikel->cHerstellerHomepage)}{$Artikel->cHerstellerHomepage}{else}{$Artikel->cHerstellerURL}{/if}"
                            {if $Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen === 'B'}
                                data-toggle="tooltip"
                                data-placement="left"
                                title="{$Artikel->cHersteller}"
                            {/if}
                        itemprop="url">
                    {/if}
                        {if ($Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen === 'B'
                            || $Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen === 'BT')
                            && !empty($Artikel->cHerstellerBildURLKlein)}
                            {image lazy=true
                                webp=true
                                src=$Artikel->cHerstellerBildURLKlein
                                alt=$Artikel->cHersteller|escape:'html'
                            }
                            <meta itemprop="image" content="{$Artikel->cHerstellerBildURLKlein}">
                        {/if}
                        {if $Einstellungen.artikeldetails.artikeldetails_hersteller_anzeigen !== 'B'}
                            <span itemprop="name">{$Artikel->cHersteller}</span>
                        {/if}
                    {if $Einstellungen.artikeldetails.artikel_weitere_artikel_hersteller_anzeigen === 'Y'}
                        </a>
                    {/if}
                </td>
            </tr>
       
    {/if}

    {if !empty($Artikel->cUNNummer) && !empty($Artikel->cGefahrnr)
    && ($Einstellungen.artikeldetails.adr_hazard_display === 'D'
    || $Einstellungen.artikeldetails.adr_hazard_display === 'DL')}
        <tr>
            <td class="h6">{lang key='adrHazardSign'}:</td>
            <td class="attr-characteristic">
                {$Artikel->cGefahrnr} - {$Artikel->cUNNummer}
            </td>
        </tr>
    {/if}
{/block}

