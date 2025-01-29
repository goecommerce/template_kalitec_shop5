{block name='checkout-step5-confirmation-order-items'}
    {card no-body=true class='card-gray card-products'}
        {cardheader}
            {row class="align-center"}
                {col class="text-left"}
                    <span class="pl-3 h3 checkout-confirmation-heading text-uppercase">{lang section="account data" key='orderOverview'}</span>
                {/col}
                {col class='col-auto'}
                    {block name='checkout-step5-confirmation-order-items-header'}
                        {button variant="link"
                            size="sm"
                            class="bg-white"
                            href="{get_static_route id='warenkorb.php'}"
                        }
                            <span class="checkout-confirmation-change">{lang key='change'}</span>
                            <span class="fa fa-pencil-alt"></span>
                        {/button}
                    {/block}
                {/col}
            {/row}
        {/cardheader}
        {cardbody}
            {block name='checkout-step5-confirmation-include-inc-order-items'}
                {include file='checkout/inc_order_items.tpl' tplscope='confirmation'}
            {/block}
        {/cardbody}
    {/card}
{/block}

{block name='checkout-step5-confirmation-order-items-actions' prepend}

    {block name='checkout-step5-confirmation-alert-agb-inner'}
        <div class="checkout-confirmation-legal-notice">
            <p>{$AGB->agbWrbNotice}</p>
        </div>
    {/block}
    {block name='checkout-step5-confirmation-include-checkbox-inner'}
        <div id="checkout-checkboxes">
            {include file='snippets/checkbox.tpl' nAnzeigeOrt=$nAnzeigeOrt cPlausi_arr=$plausiArr cPost_arr=$cPost_arr}
        </div>
    {/block}
    
{/block}



{block name='checkout-step5-confirmation-alert-agb'}

{/block}
{block name='checkout-step5-confirmation-include-checkbox'}

{/block}


{block name="checkout-step5-confirmation-pre-form-hr"}
    <hr class="checkout-confirmation-pre-form-hr d-none">
{/block}