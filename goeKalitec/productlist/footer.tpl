{block name='productlist-footer' append}
    {if (isset($Suchergebnisse->getPages()->getCurrentPage()) && $Suchergebnisse->getPages()->getCurrentPage() === 1) || !isset($Suchergebnisse->getPages()->getCurrentPage())}
        {if $Einstellungen.navigationsfilter.kategorie_beschreibung_anzeigen === 'Y'
            && $oNavigationsinfo->getCategory() !== null
            && $oNavigationsinfo->getCategory()->getDescription()|strlen > 0}
            {block name='productlist-footer-description-category'}
                <div class="hr-sect">
                    <div class="h1 mb-0">{$oNavigationsinfo->getName()}</div>
                </div>
                <div class="desc text-dark row">
                    <div class="cols col-12 col-md-8 offset-md-2 col-lg-8 offset-md-2">
                        <p>{$oNavigationsinfo->getCategory()->getDescription()}</p>
                    </div>
                </div>
            {/block}
        {/if}
        {if $Einstellungen.navigationsfilter.hersteller_beschreibung_anzeigen === 'Y'
            && $oNavigationsinfo->getManufacturer() !== null
            && $oNavigationsinfo->getManufacturer()->getDescription()|strlen > 0}
            {block name='productlist-footer-description-manufacturers'}
                <div class="hr-sect">
                    <div class="h1 mb-0">{$oNavigationsinfo->getName()}</div>
                </div>
                <div class="desc text-dark row">
                    <div class="cols col-12 col-md-8 offset-md-2 col-lg-8 offset-md-2">
                        <p>{$oNavigationsinfo->getManufacturer()->getDescription()}</p>
                    </div>
                </div>
            {/block}
        {/if}
        {if $Einstellungen.navigationsfilter.merkmalwert_beschreibung_anzeigen === 'Y'
            && $oNavigationsinfo->getCharacteristicValue() !== null
            && $oNavigationsinfo->getCharacteristicValue()->getDescription()|strlen > 0}
            {block name='productlist-footer-description-attributes'}
                <div class="hr-sect">
                    <div class="h1 mb-0">{$oNavigationsinfo->getName()}</div>
                </div>
                <div class="desc text-dark row">
                    <div class="cols col-12 col-md-8 offset-md-2 col-lg-8 offset-md-2">
                        <p>{$oNavigationsinfo->getCharacteristicValue()->getDescription()}</p>
                    </div>
                </div>
            {/block}
        {/if}
    {/if}
    </div>
{/block}