$(function(){
    setTimeout("$('.flash').fadeOut('slow')", 1000);

    let btnOpenNav = $('#btn-open-nav');
    let sideNav = $('#side-nav');
    $(btnOpenNav).on('click', function(){
        $(sideNav).addClass('is-active');
    });
});