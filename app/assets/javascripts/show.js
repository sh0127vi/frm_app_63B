$(function() {
  $(".each-image").first().addClass("active");
  $(".each-image").click(function() {
    let img = $(this).attr("src");
    $('.active-image').attr("src", img).hide().fadeIn();
    $('.each-iamge').removeClass('active');
    $(this).parent().addClass("active");
  });

  $(".each-image").css('opacity', '.4');
  $(".each-image").first().css('opacity', '10');
  $(".each-image").click(function() {
    $(".each-image").css('opacity', '.4');
    $(this).css('opacity','10');
  });
});
