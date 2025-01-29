{block name='checkout-step3-shipping-options-legend-shipping-options'}
    <div class="d-flex align-center mb-3 justify-content-between w-100">
        <div class="h2 pb-0 mb-0">{lang key='shippingOptions'}</div>
        {button href="{get_static_route id='bestellvorgang.php'}?editLieferadresse=1"
            variant="outline-primary"
            size="sm"
            class="font-size-sm btn btn-outline-primary"
        }
            <span class="text-decoration-underline">{lang key='change'}</span>
            <span class="checkout-shipping-form-change-icon fa fa-pencil-alt"></span>
        {/button}
    </div>
{/block}
{block name='checkout-step3-shipping-options-shipping-address-link'}
    <div class="checkout-shipping-form-change">
        {lang key='shippingTo' section='checkout'}: {$Lieferadresse->cStrasse} {$Lieferadresse->cHausnummer}, {$Lieferadresse->cPLZ} {$Lieferadresse->cOrt}, {$Lieferadresse->cLand}
    </div>
{/block}

{block name='checkout-step3-shipping-options' prepend}
    <div id="shipping-step-ident"></div>
{/block}