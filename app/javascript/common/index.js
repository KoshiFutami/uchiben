$(function(){
    setTimeout("$('.flash').fadeOut('slow')", 1000);

    let btnOpenNav = $('#btn-open-nav');
    let sideNav = $('#side-nav');
    $(btnOpenNav).on('click', function(){
        $(sideNav).addClass('is-active');
    });

});

$(function(){
    const commentArea = $('.vocab__comments');
    const openCommentBtn = $('.vocab__btn--comment');
    openCommentBtn.on("click", function(){
        $(this).parent().next(commentArea).toggleClass("is-active");
        $(this).prop('title', 'コメントを閉じる');
    });
    
});