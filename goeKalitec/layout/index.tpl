{block name='layout-index-include-extension' append}

    <div id="kalitec-startseite-vor-katgorien"></div>

    {if $Link->getLinkType() === $smarty.const.LINKTYP_STARTSEITE}
        <div id="kalitec-start-first"></div>

        <div id="kalitec-start-last"></div>
    {/if}

    <div id="kalitec-startseite-nach-katgorien"></div>
{/block}