{block name='layout-footer' prepend}
    <div class="container pre-footer bg-gray-light">
        <div class="contact-hook">
        </div>
        <div class="link-hook">
        </div>
    </div>
{/block}

{block name='layout-footer-newsletter'}
   {*moved to boxes due to layout*}
{/block}

{block name='layout-footer-boxes'}
    {if !empty($Einstellungen.template.kalitecfootersections.fltext)}
        <div class="text-dark">
            <img src="{$ShopLogoURL}" alt="Kalitec" class="footerLogo mb-3">
            <p>{$Einstellungen.template.kalitecfootersections.fltext}</p>
        </div>
    {/if}
    {getBoxesByPosition position='bottom' assign='footerBoxes'}
    {if isset($footerBoxes) && count($footerBoxes) > 0}
        {row id='footer-boxes'}
            {foreach $footerBoxes as $box}
                {if $box->isActive() && !empty($box->getRenderedContent())}
                    {col cols=12 sm=6 md=4 lg=3}
                        {$box->getRenderedContent()}
                    {/col}
                {/if}
            {/foreach}
            {include file="layout/newsletter-box.tpl"}
        {/row}
    {else}
        {include file="layout/newsletter-box.tpl"}
    {/if}
{/block}



{block name='layout-footer-sidepanel-left'}
 
{/block}