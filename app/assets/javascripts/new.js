$(function() {
  var file_space = $('.goods_form-image-field-box-inner');

  $(document).on('change', '#js_field,#js_field_one',function(e) {
    var new_file = $(`<input class="goods_form-image-field-box-inner-html-file" accept="image/*" type="file" name="product[images_attributes][][images]" id="js_field" data-image="i.index">`);
    file_space.prepend(new_file);

  });

  $(document).on('change', '#js_field,#js_field_one',function(e) {
    var pre=$('.goods_form-image-field-box-inner-html-text ')
    $(pre).css({'display':'none'});
    $(this).css({'display':'block'});
    $(this).css({'display':'none'});
  });

const buildImg = (index, url)=>{
  const html = `<img data-index="${index}" image="${url}" size="100×100">`;
  return html;
}

$('.goods_form-image-field-box-inner').on('change','#js_field,#js_field_one', function(e){
  const pointIndex = $(this).parent().data('index');
  const file = e.target.files[0];
  const blobUrl = window.URL.createObjectURL(file);
  if (img = $('img[data-index=${pointIndex}"]')[0]) {
    img.setAttribute('image',blobUrl);
  }else{
    $('.image_preview').append(buildImg(pointIndex,blobUrl));
  }
})
});