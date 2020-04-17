$(document).on('DOMContentLoaded turbolinks:render', function() {
  function build_file_tag(num) {
    var html = `<input class="goods_field-box-inner-html-file" multipart="true" name="product[images_attributes][${num}][images]" accept="image/*" style="opacity: 0;" type="file" id="image_${num}" data-id="${num}">`
    return html;
  }
  const first_amount = $('.img_edit').length;
  var count = first_amount;
  var file_tag = build_file_tag(first_amount);
  var nest_html = $('.inner')
  var html = nest_html.find('#js_field');
  var input_file = html.find('.goods_field-box-inner-html-file');
  function change_size(){
    $('#js_field').css({'height':''});
    $('#js_field').css({'height':'292.046'});
    $('.box').css({'height':''});
    $('.box').css({'height':'296.023'});
    $('.goods_form-image').css({'height':''});
    $('.goods_form-image').css({'height':'460'});
  };

  if(first_amount!== 0){
    if(first_amount <= 4 ){
      html.append(file_tag)
      $('.inner .goods_field-box-inner-html-file').css({
        'width': `calc(100% - (20% * ${first_amount}))`
      })
    }
    else if(first_amount == 5 ){
      change_size();
      html.append(file_tag)
      $('.inner .goods_field-box-inner-html-file').css({
        'width': `100%`,
        'height':'150px'
      })
    }
    else if(first_amount<= 9 ){
      change_size();
      html.append(file_tag)
      $('.inner .goods_field-box-inner-html-file').css({
        'width': `calc(100% - (20% * (${first_amount} - 5 )))`
      })
    }
    else if(first_amount == 10 ){
      change_size();
    }
  }

  function build_image_tag(alt, src) {
  
    var html = `<div class="margin_img" id="margin_${alt}">
                  <div class="nest_img">
                    <img class="img" src="${src}" id="preview_${alt}">
                    <div class = "edit_image_btn" >
                      <div class = "destroy_btn" data-id="${alt}">
                      削除
                      </div>
                      <div class = "edit_btn" id=${alt}>
                      <input class="image_edit-field" accept="image/*" id="image_${alt}" name="product[images_attributes][${alt}][images]" data-id="${alt}" type="file">
                      <p class = "image_edit-text">編集</p>
                      </div>
                    </div>
                  </div>
                </div>`
    return html;
  }
  function build_text(){
    var html=`<div class="field_text">
                <img src="/assets/material/icon/icon_camera.png" alt="カメラ" width="40">
                <p>クリックしてファイルをアップロード</p>
              </div>`
    return html;
  }


  html.on('change', 'input[type="file"]', function (e) {
    var id = $(this).data('id');
    var file = e.target.files[0];
    var file_reader = new FileReader();
    if($('#'+id)[0]){
      file_reader.onload = (function () {
        return function (e) {
          var image = e.target.result
          console.log(image);
          $('#preview_'+id).attr('src',image);
        }
      })(file);
      file_reader.readAsDataURL(file);
    }else{
    $('.goods_field-box-inner-html-file').css({'display':'none'});
    var current_file =$("#js_field input:last");
    current_file.css({'display':'none'});
    file_reader.onload = (function () {
      return function (e) {

        image_tag = build_image_tag(count, e.target.result);
        html.append(image_tag);
        $('.field_text').remove();
        html.css({'display':'flex'});

        
        count += 1;
        file_tag = build_file_tag(count);
        var total_amount = $('.img').length;
        if(total_amount<10){
        html.append(file_tag);
        }

        $("#js_field input:last").css({
          'opacity': '0',
          'position': 'relative',
          'z-index': '1',
          'cursor': 'pointer',
          'display': 'block',
          'width': `calc(100% - (20% * (${$('.img').length})))`
      });

      if (total_amount>4){
        change_size();
      }
      if(total_amount==5){
        $("#js_field input:last").css({
          'width':'100%',
          'height':'150px'
        });
      }
      if(total_amount>5){
        $("#js_field input:last").css({'width': `calc(100% - (20% * (${$('.img').length} - 5)))`});
      }
      if(total_amount == 10){
        $(".image_edit-field").css({'width': '57.997'})
      }

      };
    })(file);

     file_reader.readAsDataURL(file);
  }
  });

  $(document).on("click", '.destroy_btn', function(){
    var html = $('#js_field');
    var total_amount = $('.img').length;
    var target_index = $(this).data('id');
    var hiddenDestroy = $(`input[data-id="${target_index}"].hidden_destroy`);
    console.log(hiddenDestroy);
    if(hiddenDestroy.length){ 
      hiddenDestroy.prop('checked', true);
      $('#margin_'+target_index).remove();
      $('#image_'+target_index).remove();
  }else{
    $('#margin_'+target_index).remove();
    $('#image_'+target_index).remove();
  }

    if(total_amount==1){
      text_html = build_text();
      $(html).css({'display':''});
      $(html).append(text_html);
      $("#js_field input:last").css({
        'width':'100%',
        'height':'146.023px'

      });
    }else if (total_amount<6){
      html.css({'height':''});
      $('.box').css({'height':''});
      $('.goods_form-image').css({'height':''});
      $("#js_field input:last").css({
      'width': `calc(100% - (20% * (${$('.img').length})))`
    });
    }else if(total_amount==6){
      $("#js_field input:last").css({
        'width':'100%',
        'height':'146.023px'
      });
    }else if(total_amount<10){
      $("#js_field input:last").css({'width': `calc(100% - (20% * (${$('.img').length} - 5)))`});
    }else if(total_amount==10){
      html.append(file_tag);
      $("#js_field input:last").css({'width': `calc(100% - (20% * (${$('.img').length} - 5)))`});
    }
  });



$(".goods_form-send-redbtn").on('click',function(){
  last_input=$("#js_field input:last");
  if(last_input.val()==""){
  last_input.remove();
  }
})
});