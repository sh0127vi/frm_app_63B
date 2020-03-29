$(function() {

   console.log("hello");
  $(".each-image").click(function() {
    let actImg = $(this).attr("src");
    $(".active-image").attr({src:actImg});
    $(".active-image").hide();
    $(".active-image").fadeIn();
      return false;
  });

});