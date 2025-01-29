{block name='productlist-header-description'}
    {$showTitle = true}
    {$showImage = true}
    {$navData = null}
    {if $oNavigationsinfo->getCategory() !== null}
        {$showTitle = in_array($Einstellungen['navigationsfilter']['kategorie_bild_anzeigen'], ['Y', 'BT'])}
        {$showImage = in_array($Einstellungen['navigationsfilter']['kategorie_bild_anzeigen'], ['B', 'BT'])}
        {$navData = $oNavigationsinfo->getCategory()}
        {if $Einstellungen.template.megamenu.mobile_start_category === 'Y'}
            <input type="hidden" id="category-id" value="{$oNavigationsinfo->getCategory()->getID()}">
        {/if}
    {elseif $oNavigationsinfo->getManufacturer() !== null}
        {$showImage = in_array($Einstellungen['navigationsfilter']['hersteller_bild_anzeigen'], ['B', 'BT'])}
        {$showTitle = in_array($Einstellungen['navigationsfilter']['hersteller_bild_anzeigen'], ['Y', 'BT'])}
        {$navData = $oNavigationsinfo->getManufacturer()}
    {elseif $oNavigationsinfo->getCharacteristicValue() !== null}
        {$showImage = in_array($Einstellungen['navigationsfilter']['merkmalwert_bild_anzeigen'], ['B', 'BT'])}
        {$showTitle = in_array($Einstellungen['navigationsfilter']['merkmalwert_bild_anzeigen'], ['Y', 'BT'])}
        {$navData = $oNavigationsinfo->getCharacteristicValue()}
    {/if}
    {if $oNavigationsinfo->getImageURL() !== $smarty.const.BILD_KEIN_KATEGORIEBILD_VORHANDEN
        && $oNavigationsinfo->getImageURL() !== 'gfx/keinBild_kl.gif'
        && $oNavigationsinfo->getImageURL() !== $imageBaseURL|cat:$smarty.const.BILD_KEIN_KATEGORIEBILD_VORHANDEN
        && $showImage}
            
    {/if}
    

    {if $Einstellungen.navigationsfilter.kategorie_beschreibung_anzeigen === 'Y'
        && $oNavigationsinfo->getCategory() !== null
        && $oNavigationsinfo->getCategory()->getDescription()|strlen > 0}
        {block name='productlist-header-description-category'}

        {/block}
    {/if}
    {if $Einstellungen.navigationsfilter.hersteller_beschreibung_anzeigen === 'Y'
        && $oNavigationsinfo->getManufacturer() !== null
        && $oNavigationsinfo->getManufacturer()->getDescription()|strlen > 0}
        {block name='productlist-header-description-manufacturers'}

        {/block}
    {/if}
    {if $Einstellungen.navigationsfilter.merkmalwert_beschreibung_anzeigen === 'Y'
        && $oNavigationsinfo->getCharacteristicValue() !== null
        && $oNavigationsinfo->getCharacteristicValue()->getDescription()|strlen > 0}
        {block name='productlist-header-description-attributes'}

        {/block}
    {/if}
{/block}

{block name='productlist-header-subcategories'}
    {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'N' && $oUnterKategorien_arr|count > 0}
        {opcMountPoint id='opc_before_subcategories'}
        {row class="row-eq-height content-cats-small catrow"}
            {foreach $oUnterKategorien_arr as $subCategory}
                {col cols=6 md=4 lg=3 class="kalitec-start-cat"}
                    <div class="sub-categories">
                        {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'Y'}
                            {block name='productlist-header-subcategories-image'}
                                {link href=$subCategory->getURL() class="kalitec-start-cat-link inner"}
                                    {$imgAlt = $subCategory->getAttribute('img_alt')}
                                    {$imgSrc = $subCategory->getImage(\JTL\Media\Image::SIZE_SM)}
                                    <div class="wrap square-image square catwrap-gradient">
                                        {if strpos($imgSrc, 'keinBild.gif')}
                                            <img src="{$ShopLogoURL}" alt="" class="w-100 p-3">
                                        {else}
                                            {image fluid=true lazy=true webp=true
                                                src=$imgSrc
                                                width="{if strpos($imgSrc, 'keinBild.gif') !== false}
                                                    130
                                                {else}
                                                    {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_XL)}
                                                {/if}"|strip
                                                height="{if strpos($imgSrc, 'keinBild.gif') !== false}
                                                    130
                                                {else}
                                                    {$subCategory->getImageHeight(\JTL\Media\Image::SIZE_XL)}
                                                {/if}"|strip
                                                alt="{if empty($imgAlt->cWert)}{$subCategory->getName()}{else}{$imgAlt->cWert}{/if}"
                                                srcset="
                                                    {$subCategory->getImage(\JTL\Media\Image::SIZE_XL)}
                                                    {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_XL)}w,
                                                    {$subCategory->getImage(\JTL\Media\Image::SIZE_XL)}
                                                    {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_XL)}w,
                                                    {$subCategory->getImage(\JTL\Media\Image::SIZE_XL)}
                                                    {$subCategory->getImageWidth(\JTL\Media\Image::SIZE_XL)}w"|strip
                                                sizes="(min-width: 992px) 25vw, 33vw"
                                            }
                                        {/if}
                                    </div>
                                {/link}
                            {/block}
                        {/if}
                        
                            {if $Einstellungen.navigationsfilter.artikeluebersicht_bild_anzeigen !== 'B'}
                                {block name='productlist-header-subcategories-link'}
                                   
                                    {link href=$subCategory->getURL() class="kalitec-start-cat-btn btn btn-invert-primary btn-block pl-3 pr-3 text-left"}
                                        {$subCategory->getName()}
                                    {/link}
                                  
                                {/block}
                            {/if}
                            {if $Einstellungen.navigationsfilter.unterkategorien_beschreibung_anzeigen === 'Y'
                                    && !empty($subCategory->getDescription())}
                                {block name='productlist-header-subcategories-description'}
                                   
                                {/block}
                            {/if}
                            {if $Einstellungen.navigationsfilter.unterkategorien_lvl2_anzeigen === 'Y'}
                                {if $subCategory->hasChildren()}
                                    {block name='productlist-header-subcategories-list'}
                                       
                                    {/block}
                                {/if}
                            {/if}
                        
                    </div>
                {/col}
            {/foreach}
        {/row}
    {/if}
{/block}