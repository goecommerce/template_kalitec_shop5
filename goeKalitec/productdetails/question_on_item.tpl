{block name='productdetails-question-on-item-form' prepend}
    <p class="h2qua d-lg-none">{lang key='contact'}</p>
    <div class="row">
        <div class="cols col-12 col-md-12 col-lg-9">
        <p class="h2qua d-none d-lg-block">{lang key='contact'}</p>
{/block}

{block name='productdetails-question-on-item-form-submit'}
    {input type="hidden" name="a" value=$Artikel->kArtikel}
    {input type="hidden" name="show" value="1"}
    {input type="hidden" name="fragezumprodukt" value="1"}
    {row}
        {col md='auto' class="ml-auto-util"}
            {button type="submit" value="1" variant="primary" block=true class="align-center d-flex justify-content-center"}
                <i class="fas fa-submit fa15x"></i>&nbsp;{lang key='sendQuestion' section='productDetails'}
            {/button}
        {/col}
    {/row}
{/block}

{block name='productdetails-question-on-item' append}
        </div>
        <div class="cols col-12 col-md-12 col-lg-3 d-none d-lg-block qoiContact" id="contact-hook-desktop">
        </div>
    </div>
    <div id="contact-question-mobile" class="d-lg-none qoiContact"></div>
{/block}