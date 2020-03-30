$(function() {
  $(".each-image").first().addClass("active");
  $(".each-image").click(function() {
    let img = $(this).attr("src");
    $('.active-image').attr("src", img).hide().fadeIn();
    $('.each-iamge').removeClass('active');
    $(this).parent().addClass("active");
  });

});