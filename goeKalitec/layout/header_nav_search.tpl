{block name='layout-header-nav-search'}
    {assign var="searchText" value='<i id="mobile-search-dropdown" class="fas fa-search"></i><br class="d-none d-xl-inline"><span class="d-none d-xl-inline">'|cat:{lang key="find" section="global"}|cat:'</span>'}
    {block name='layout-header-nav-search-search'}
        {navitemdropdown tag='div' class='search-wrapper-dropdown d-none d-lg-block text-center'
        text={$searchText}
        right=true
        no-caret=true
        router-aria=['label'=>{lang key='findProduct'}]}
        <div class="dropdown-body">
            {include file='snippets/search_form.tpl' id='search-header-desktop'}
        </div>
    {/navitemdropdown}
    {/block}
    {block name='layout-header-nav-search-search-dropdown'}
        {if $Einstellungen.template.header.mobile_search_type === 'dropdown'}
            {navitemdropdown tag='div' class='search-wrapper-dropdown d-block d-lg-none'
                text='<i id="mobile-search-dropdown" class="fas fa-search"></i>'
                right=true
                no-caret=true
                router-aria=['label'=>{lang key='findProduct'}]}
                <div class="dropdown-body">
                    {include file='snippets/search_form.tpl' id='search-header-desktop'}
                </div>
            {/navitemdropdown}
        {/if}
    {/block}
{/block}
