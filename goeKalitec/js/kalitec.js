function faviconAnim(){
    if ($("link[rel='icon']").length) {
        $("link[rel='icon']").attr("href", "https://kalitec.goedev.de/templates/goeKalitec/themes/kalitec/gfx/kalitec_favion_animated.gif")
    }
}

function pushModalDetail(){
    if ($(".push-aligner").length) {
        $(".push-aligner").click(function(){
            $(this).remove();
        })
    }
}

function menuHoverState() {
    if ($(".categories-recursive-dropdown.is-desktop").length) {
        $(".categories-recursive-dropdown.is-desktop").each(function(){
            $(this).mouseenter(function(){
                $(this).parent().addClass("is-active");
            })
            $(this).mouseleave(function(){
                $(this).parent().removeClass("is-active");
            })
        })
    }
    if ($("#mainNavigation").length) {
        var navImage = "";
        var navAlt = "";
        $("#mainNavigation a").each(function(){
            $(this).mouseenter(function(){
                navImage = $(this).attr("data-cat-img-src");
                navAlt = $(this).attr("data-cat-img-alt");
                console.log(navImage,navAlt);
                if (navImage.indexOf("keinBild") > -1) {
                    // no image
                    console.log("empty image");
                }
                else {
                    $(".cat-image img").attr("src", navImage).attr("alt", navAlt);
                    console.log("show image");
                }
                
            })
            $(this).mouseleave(function(){
                $(".cat-image img").attr("src", "").attr("alt", "");
            })
        })
    }
}

function tileHeight() {
    if ($(".tile-teaser").length) {
        $(".tile-teaser").each(function(){
            var tHeight = $(this).height();
            $(this).find(".tile-teaser-bg-fix").css("height", tHeight);
        })
    }
}


function wkHeight(){
    if ($(window).width() <= 991) {
        if ($(".cart-dropdown .table-responsive").length) {
            $(".cart-icon-dropdown").click(function(){
                setTimeout(function(){
                    var headerHeight = $("header").outerHeight();
                    var wdwHeight = $(window).outerHeight();
                    var footerHeight = $(".cart-dropdown > .dropdown-body").outerHeight();
                    var cartHeight = wdwHeight-(headerHeight+footerHeight);
                    var cartTable = $(".cart-dropdown .table-responsive");
                    cartTable.css("max-height", cartHeight+"px").css("min-height", cartHeight+"px");
                }, 200);
            });
        }
    }
}

function autoHeight() {
    $(".productbox-title").matchHeight();
    $(".kalitec-start-cat-btn").matchHeight();
    $(".productbox-inner .price_wrapper").matchHeight();
}

function mobLang() {
    if ($(".mobile-sticky-menu .language-dropdown").length) {
        $(".mobile-sticky-menu .language-dropdown .dropdown-toggle").toggleClass("active");
        $(".mobile-sticky-menu .language-dropdown .dropdown-toggle").parent().toggleClass("active");
        $(".mobile-sticky-menu .language-dropdown .dropdown-toggle").click(function(){
            $("a.nav-offcanvas-title").removeClass("d-none");
            $("span.nav-offcanvas-title").addClass("d-none");
        })
        $(document).on("click", ".modal-backdrop, .mobile-sticky-menu .language-dropdown .dropdown-menu", function(){
            $("a.nav-offcanvas-title").addClass("d-none");
            $("span.nav-offcanvas-title").removeClass("d-none");
            $(".mobile-sticky-menu .language-dropdown .dropdown-toggle").toggleClass("active");
            $(".mobile-sticky-menu .language-dropdown .dropdown-toggle").parent().toggleClass("active");
            $(".navbar-nav").css("transform","translateX(0)");
        })
    }
}

$(document).ready(function(){
    autoHeight();
    faviconAnim();
    tileHeight();
    menuHoverState();
    pushModalDetail();
    mobLang();
    wkHeight();
})

$(window).resize(function(){
    tileHeight();
    wkHeight();
})