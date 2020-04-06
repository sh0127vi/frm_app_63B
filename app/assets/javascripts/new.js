$(document).on('DOMContentLoaded turbolinks:render', function() {

  var image_file = $('.goods_field-box-inner-html');
  var image_count = 0;
  var image_tag;
  var file_tag;

  function build_image_tag(alt, src) {
  
    var html = `<div class="margin_img" id="${alt}">
                  <div class="nest_img">
                    <img class="img" src="${src}" >
                      <div class = "delete_btn" >
                      削除
                      </div>
                  </div>
                </div>`
    return html;
  }

  function build_file_tag(num) {
    var html = `<input class="goods_field-box-inner-html-file" multipart="true" name="product[images_attributes][${num}][images]" accept="image/*" style="opacity: 0;" type="file" id="image_${num}">`
    return html;
  }

  function build_text(){
    var html=`<div class="goods_field-box-inner-html_text">
                <img src="/assets/material/icon/icon_camera.png" alt="カメラ" width="40">
                <p>クリックしてファイルをアップロード</p>
              </div>`
    return html;
  }


  image_file.on('click', function() {
    image_file.children('input[name="product[images_attributes][][images]"]')[0];
  })


  image_file.on('change', image_file.children('input[name="product[images_attributes][' + image_count + '][images]"]'), function (e) {
    var file = e.target.files[0];
    var file_reader = new FileReader();
    var current_file =$("#js_html input:last");
    current_file.css({'display':'none'});
    $('.goods_field-box-inner-html-file').css({'display':'none'});

    file_reader.onload = (function () {
      return function (e) {

        image_tag = build_image_tag(image_count, e.target.result);
        $('.goods_field-box-inner-html').append(image_tag);
        $('.goods_field-box-inner-html_text').remove();
        $('.goods_field-box-inner-html').css({'display':'flex'});

        var count = $('.img').length;
        image_count += 1;
        file_tag = build_file_tag(image_count);
        if(count<10){
        image_file.append(file_tag);
        }

        $("#js_html input:last").css({
          'opacity': '0',
          'position': 'relative',
          'z-index': '1',
          'cursor': 'pointer',
          'display': 'block',
          'width': `calc(100% - (20% * (${$('.img').length})))`
      });

      if (count>4){
        image_file.css({'height':''});
        image_file.css({'height':'300'});
        $('.goods_field-box').css({'height':''});
        $('.goods_field-box').css({'height':'305'});
        $('.goods_form-image').css({'height':''});
        $('.goods_form-image').css({'height':'460'});
      }
      if(count==5){
        $("#js_html input:last").css({
          'width':'100%',
          'height':'150px'
        });
      }
      if(count>5){
        $("#js_html input:last").css({'width': `calc(100% - (20% * (${$('.img').length} - 5)))`});
      }

      };
    })(file);

     file_reader.readAsDataURL(file);

  });

  var file_field = document.querySelector('input[type=file]');
  $(document).on("click", '.delete_btn', function(){
    var count = $('.img').length;
    var target_image = $(this).parent().parent();
    var imgId = target_image.attr("id");
    $(`#image_${imgId}`).remove();
    target_image.remove();
    if(count==1){
      text_html = build_text();
      $('.goods_field-box-inner-html').css({'display':''});
      $('.goods_field-box-inner-html').append(text_html);
      $("#js_html input:last").css({
        'width':'100%',
        'height':'150px',
      });
    }else if (count<6){
      image_file.css({'height':''});
      $('.goods_field-box').css({'height':''});
      $('.goods_form-image').css({'height':''});
      $("#js_html input:last").css({
      'width': `calc(100% - (20% * (${$('.img').length})))`
    });
    }else if(count==5){
      $("#js_html input:last").css({
        'width':'100%',
        'height':'150px'
      });
    }else if(count<9){
      $("#js_html input:last").css({'width': `calc(100% - (20% * (${$('.img').length} - 5)))`});
    }else if(count==10){
      image_file.append(file_tag);
      $("#js_html input:last").css({'width': `calc(100% - (20% * (${$('.img').length} - 5)))`});
    }
  })

  $(".goods_form-send-redbtn").on('click',function(){
    $("#js_html input:last").remove();
  })
});