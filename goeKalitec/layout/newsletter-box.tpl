{block name='layout-footer-newsletter-inner'}
    <div class="col  col-sm-6 col-md-4 col-lg-3 col-12">
        <div class="box box-linkgroup box-normal text-left-util" id="boxnewsletter">
            <a href="#crd-cllps-newsletter" id="crd-hdr-newsletter" class="box-normal-link dropdown-toggle" role="button" aria-expanded="false" aria-controls="crd-cllps-newsletter" data-toggle="collapse">
                <span class="text-truncate">
                    {lang key='newsletter' section='newsletter'} {lang key='newsletterSendSubscribe' section='newsletter'}
                </span>
            </a>        
            <div class="productlist-filter-headline d-none d-md-flex">
            {lang key='newsletter' section='newsletter'} {lang key='newsletterSendSubscribe' section='newsletter'}
            </div>
            <p class="d-none d-lg-block text-dark">
            {lang key="newsletterIntrotext" section="custom"}
            </p>
            <div class="collapse d-md-block" id="crd-cllps-newsletter" aria-labelledby="crd-hdr-newsletter">
                <div class="nav-panel box-nav-item">
                    {form methopd="post" action="{get_static_route id='newsletter.php'}"}
                        {block name='layout-footer-form-content'}
                            {input type="hidden" name="abonnieren" value="2"}
                            {formgroup label-sr-only="{lang key='emailadress'}" class="newsletter-email-wrapper"}
                                {inputgroup}
                                    {input type="email" name="cEmail" id="newsletter_email" placeholder="{lang key='emailadress'}" aria=['label' => {lang key='emailadress'}]}
                                    {inputgroupaddon append=true}
                                        {button type='submit' variant='secondary' class='min-w-sm'}
                                            {lang key='newsletterSendSubscribe' section='newsletter'}
                                        {/button}
                                    {/inputgroupaddon}
                                {/inputgroup}
                            {/formgroup}
                        {/block}
                        {block name='layout-footer-form-captcha'}
                            <div class="{if !empty($plausiArr.captcha) && $plausiArr.captcha === true} has-error{/if}">
                                {captchaMarkup getBody=true}
                            </div>
                        {/block}
                    {/form}
                </div>
            </div>
        </div>
    </div>

{/block}