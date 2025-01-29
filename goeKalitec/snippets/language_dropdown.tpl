{block name='snippets-language-dropdown'}
    {$languages = JTL\Session\Frontend::getLanguages()}
    {if $languages|count > 1}
        {capture langSelectorText}
            {foreach $languages as $language}
                {if $language->getId() === JTL\Shop::getLanguageID()}
                    {block name='snippets-language-dropdown-text'}
                        <i class="flags flag-desk flag-{$language->getIso639()}"><img src="/templates/goeKalitec/themes/kalitec/gfx/flags/4x3/{$language->getIso639()}.svg" alt="Flagge für {$language->getLocalizedName()}"></i>&nbsp;<span class="fw-bold">{$language->getLocalizedName()|upper}</span>
                    {/block}
                {/if}
            {/foreach}
        {/capture}
        {navitemdropdown
        class="language-dropdown {$dropdownClass|default:''}"
        right=true
        text=$smarty.capture.langSelectorText}
            {foreach $languages as $language}
                {block name='snippets-language-dropdown-item'}
                    {dropdownitem href="{$language->getUrl()}"
                        class="link-lang"
                        data=["iso"=>$language->getIso()]
                        attribs=["hreflang"=>$language->getIso639()]
                        active=($language->getId() === JTL\Shop::getLanguageID())}
                        <i class="flags flag-desk flag-{$language->getIso639()}"><img src="/templates/goeKalitec/themes/kalitec/gfx/flags/4x3/{$language->getIso639()}.svg" alt="Flagge für {$language->getLocalizedName()}"></i>&nbsp;{$language->getLocalizedName()|upper}
                    {/dropdownitem}
                {/block}
            {/foreach}
        {/navitemdropdown}
    {/if}
{/block}
