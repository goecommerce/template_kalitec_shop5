{block name='checkout-inc-payment-methods-image-title'}
    {if $zahlungsart->cBild}
            {image src=$zahlungsart->cBild alt=$zahlungsart->angezeigterName|trans fluid=true class="img-sm"}
            <span class="content">
                <span class="title">{$zahlungsart->angezeigterName|trans}</span>
            </span>
    {else}
        <span class="content">
            <span class="title">{$zahlungsart->angezeigterName|trans}</span>
        </span>
    {/if}
{/block}