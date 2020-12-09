$(function(){
    setTimeout("$('.flash').fadeOut('slow')", 1000);

    let btnOpenNav = $('#btn-open-nav');
    let sideNav = $('#side-nav');
    $(btnOpenNav).on('click', function(){
        $(sideNav).addClass('is-active');
    });

});

$(function(){
    // Toggleファンクション
    $.fn.clickToggle = function(a, b) {
        return this.each(function() {
            let clicked = false;
            $(this).on('click', function() {
                clicked = !clicked;
                if (clicked) {
                    return a.apply(this, arguments);
                }
                return b.apply(this, arguments);
            });
        });
    }


    var commentArea = $('.vocab__comments');
    var openCommentBtn = $('.vocab__btn--comment');
    openCommentBtn.prop('title', 'コメント欄を表示');

    openCommentBtn.clickToggle(function() {
        $(this).parent().next(commentArea).addClass("is-active");
        $(this).prop('title', 'コメント欄を非表示');
    }, function(){
        $(this).parent().next(commentArea).removeClass("is-active");
        $(this).prop('title', 'コメント欄を表示');
    });

    // openCommentBtn.on("click", function(){
    //     $(this).parent().next(commentArea).toggleClass("is-active");
    //     $(this).prop('title', 'コメント欄を非表示');
    // });
 
});


// ページ内リンクのヘッダー高さ分の調整
$(function(){
    let headerHeight = $('.header').outerHeight();
    $('a[href^="#"').on('click', function(){
        let speed = 800;
        let href = $(this).attr("href");
        let target = $(href == "#" || href == "" ? 'html' : href);
        let position = target.offset().top-headerHeight;
        $('body, html').animate({scrollTop: position}, speed, 'swing');
        return false;
    });
});

// ヘッダーのドロップダウンメニュー
$(function(){
    let btnOpenDropdown = $('#btn-open-dropdown');
    let dropdownMenu = $('.header__dropdown');
    let overlay = $('.header__overlay');
    btnOpenDropdown.on('click', function(){
        dropdownMenu.addClass('is-active');
        overlay.addClass('is-active');
        
        overlay.on('click', function(){
            dropdownMenu.removeClass('is-active');
            $(this).removeClass('is-active');
        });
    });
});