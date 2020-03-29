
(function(){

  let submit = document.getElementById("#payment_card_submit-button");

  Payjp.setPublicKey('pk_test_48fc34de544ae5c99d8d81c3'); //公開鍵の記述

  submit.addEventListener('click', function(e){ //ボタンが押されたらトークン作成開始。ボタンのクラス名まだない。

    e.preventDefault(); //ボタンを1度無効化
    form.find("input[type=submit]").prop("disabled", true);

    let card = { //入力されたカード情報を取得
        number: $("#payment_card_no").val(),
        cvc: $("#payment_card_cvc").val(),
        exp_month: $("#payment_card_month").val(),
        exp_year: $("#payment_card_year").val(),
    };
    Payjp.createToken(card, function(s, response) {  // トークンを生成
      if (status === 200) { //成功した場合
        $("#card_number").removeAttr("name");
        $("#cvc").removeAttr("name");
        $("#exp_month").removeAttr("name");
        $("#exp_year").removeAttr("name"); //データを自サーバにpostしないように削除
        $("#card_token").append(
          $('<input type="hidden" name="payjp-token">').val(response.id)
        );
        document.inputForm.submit(); //取得したトークンを送信できる状態にします
        window.alert("登録が完了しました"); //確認用
      } else {
        window.alert("カード情報が正しくありません。"); //確認用
        form.find('button').prop('disabled', false);
      }
    });
  });
});