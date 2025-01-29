{block name="kalitec-kat-wrapper"}
    
    

    {container id="kalitec-kategorien-startseite" class="bg-gray-light pb-3"}
        {get_category_array categoryId=$categoryId categoryBoxNumber=$categoryBoxNumber assign='categories'}
        <div class="cat-wrapper-start mt-3 mb-3">
            <div class="row">
                <div class="col-12"> 
                    <h2 class="hr-sect">{lang key="ourCategories" section="custom"}</h2>
                </div>
            </div>
            <div class="row d-flex catrow">
                {if !empty($categories)}
                    {block name='kalitec-start-recursive-categories'}
                        {foreach $categories as $category}
                            
                            
                          
                                {foreach $category->children as $ccategory}
                                    
                                        {*if !empty($ccategory->functionalAttributes["show_on_frontpage"])*}
                                            <div class="col-6 col-md-4 col-lg-3 kalitec-start-cat" data-kalitec-start-id="{$ccategory->getID()}" style="order:{$ccategory->functionalAttributes["show_on_frontpage"]}">
                                                <div class="wrap square-image square bg-gray-lighter">
                                                    {foreach $ccategory->images as $ccatimg}
                                                        <a class="kalitec-start-cat-link inner" href="{$ccategory->getURL()}">
                                                            <img class="img-fluid" src="{$ccatimg["lg"]}" alt="{$ccategory->getShortName()}" />
                                                        </a>
                                                    {/foreach}
                                                </div>
                                                    
                                                <a class="kalitec-start-cat-btn btn btn-invert-primary btn-block caption pl-3 pr-3 text-left" href="{$ccategory->getURL()}">{$ccategory->getShortName()}</a>
                                                
                                                <div class="kalitec-start-cat-desc d-none">
                                                    {$ccategory->functionalAttributes["show_on_frontpage"]->Wert}
                                                </div>
                                                
                                            </div>
                                        {*/if*}
                                        
                                        {foreach $ccategory->children as $cccategory}
                                    
                                                {if !empty($cccategory->functionalAttributes["show_on_frontpage"])}
                                                    <div class="col-6 col-md-4 col-lg-3 kalitec-start-cat mb-3" data-kalitec-start-id="{$cccategory->getID()}" style="order:{$cccategory->functionalAttributes["show_on_frontpage"]}">
                                                        <div class="wrap">
                                                            {foreach $cccategory->images as $ccatimg}
                                                                <a class="kalitec-start-cat-link" href="{$cccategory->getURL()}">
                                                                    <img class="w-100" src="{$ccatimg["lg"]}" alt="{$cccategory->getShortName()}" />
                                                                </a>
                                                            {/foreach}
                                                            
                                                            <a class="kalitec-start-cat-btn btn btn-outline-primary btn-block caption pl-3 pr-3" href="{$cccategory->getURL()}">{$cccategory->getShortName()}</a>
                                                            
                                                            <div class="kalitec-start-cat-desc d-none">
                                                                {$cccategory->functionalAttributes["show_on_frontpage"]->Wert}
                                                            </div>
                                                        </div>
                                                    </div>
                                                {/if}
                                                
                                            
                                        {/foreach}
                                    
                                {/foreach}
                          
                                {if !empty($category->functionalAttributes["show_on_frontpage"])}
                                <div class="col-6 col-md-4 col-lg-3 kalitec-start-cat mb-3" data-kalitec-start-id="{$category->getID()}" style="order:{$category->functionalAttributes["show_on_frontpage"]}">
                                 
                                    <div class="wrap">
                                        {foreach $category->images as $ccatimg}
                                            <a class="kalitec-start-cat-link" href="{$category->getURL()}">
                                                <img class="w-100" src="{$ccatimg["lg"]}" alt="{$category->getShortName()}" />
                                            </a>
                                        {/foreach}
                                        
                                        
                                        <a class="kalitec-start-cat-btn btn btn-outline-primary btn-block caption pl-3 pr-3" href="{$category->getURL()}">{$category->getShortName()}</a>
                                        
                                        <div class="kalitec-start-cat-desc d-none">
                                            {$category->functionalAttributes["show_on_frontpage"]}
                                        </div>
                                    </div>
                                    
                                </div>
                                {/if}
                           
                        {/foreach}
                    {/block}
                {/if}
            </div>
        </div>
    {/container}


{/block}