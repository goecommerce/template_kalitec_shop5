{block name='snippets-language-dropdown'}
    {$languages = JTL\Session\Frontend::getLanguages()}
    {if $languages|count > 1}
        {capture langSelectorText}
            {foreach $languages as $language}
                {if $language->getId() === JTL\Shop::getLanguageID()}
                    {block name='snippets-language-dropdown-text'}
                        <i class="flags flag-{$language->getIso639()}"><img src="/templates/goeKalitec/themes/kalitec/gfx/flags/4x3/{$language->getIso639()}.svg" alt="Flagge für {$language->getLocalizedName()}"></i> {$language->getLocalizedName()|upper}
                    {/block}
                {/if}
            {/foreach}
        {/capture}
        {navitemdropdown
        class="language-dropdown {$dropdownClass|default:''}"
        right=true
        text=$smarty.capture.langSelectorText}
            <ul>
                {foreach $languages as $language}
                    {block name='snippets-language-dropdown-item'}
                        <li>
                        <a href="{$language->getUrl()}"
                            class="link-lang link-lang-mob"
                            data-iso="{$language->getIso()}">
                                <i class="flags flag-{$language->getIso639()}"><img src="/templates/goeKalitec/themes/kalitec/gfx/flags/4x3/{$language->getIso639()}.svg" alt="Flagge für {$language->getLocalizedName()}"></i> {$language->getLocalizedName()|upper}      
                        </a>
                        </li>
                    {/block}
                {/foreach}
            </ul>
        {/navitemdropdown}
    {/if}
{/block}
