{block name='snippets-productlist-page-nav-result-options-sort'}
    {if $oNavigationsinfo->getName() && $showTitle}
        {if !$isMobile || !$isTablet}
            <div class="title mb-0">
                {opcMountPoint id='opc_before_heading'}
                {block name='productlist-header-description-heading'}
                    <h1 class="h2 mt-0 mb-0">{$oNavigationsinfo->getName()}</h1>
                {/block}
            </div>
        {/if}
    {/if}
    {col cols=12 xl="auto" class="displayoptions"}
        {block name='snippets-productlist-page-nav-include-result-options'}
            {if count($Suchergebnisse->getProducts()) > 0}
                {opcMountPoint id='opc_before_result_options'}
            {/if}
            {$filterPlacement='modal'}
            {if $isMobile && !$isTablet}
                {$filterPlacement="modal"}
            {elseif $isTablet || $Einstellungen.template.productlist.filter_placement === 'modal'}
                {$filterPlacement="modal"}
            {/if}
            <div id="improve_search" class="w-100 result-option-wrapper mb-3 {if $filterPlacement !== 'collapse'}d-inline-block btn-group{/if} {if $filterPlacement === ''}d-lg-none{/if}">
                {include file='productlist/result_options.tpl'
                    itemCount=$Suchergebnisse->getProductCount()
                    filterPlacement=$filterPlacement}
            </div>
        {/block}
        
        
        {if !$isMobile || $isTablet}
            {block name='snippets-productlist-page-nav-actions'}
                {block name='snippets-productlist-page-nav-actions-sort'}
                    {if count($Suchergebnisse->getSortingOptions()) > 0}
                    {dropdown class="filter-type-FilterItemSort btn-group" variant="outline-secondary" text="{lang key='sorting' section='productOverview'}"}
                        {foreach $Suchergebnisse->getSortingOptions() as $option}
                            {dropdownitem rel="nofollow" href=$option->getURL() class="page-nav-filter-item" active=$option->isActive()}
                                {$option->getName()}
                            {/dropdownitem}
                        {/foreach}
                    {/dropdown}
                    {/if}
                {/block}
                {block name='snippets-productlist-page-nav-actions-items'}
                   
                {/block}
                
            {/block}
        {/if}
        {if !$isMobile || !$isTablet}
            {block name='snippets-productlist-page-nav-include-layout-options'}
                {include file='productlist/layout_options.tpl'}
            {/block}
        {/if}
    {/col}
{/block}