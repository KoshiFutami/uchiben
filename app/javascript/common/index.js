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
