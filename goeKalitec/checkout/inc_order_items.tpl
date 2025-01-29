{block name='checkout-inc-order-items-image'}
    {if $Einstellungen.kaufabwicklung.warenkorb_produktbilder_anzeigen === 'Y'}
        {col cols=3 lg=2 class="checkout-items-item-image-wrapper"}
            {if !empty($oPosition->Artikel->cVorschaubildURL)}
                {link href=$oPosition->Artikel->cURLFull title=$oPosition->cName|transByISO|escape:'html'}
                    {include file='snippets/image.tpl' item=$oPosition->Artikel square=false srcSize='sm'}
                {/link}
            {/if}
            {if $oPosition->nPosTyp === 2}
                <span class="w-100 text-center d-block"><i class="fa fa-truck fa3x"></i></span>
            {/if}
        {/col}
    {/if}
{/block}