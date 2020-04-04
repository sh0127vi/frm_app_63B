$(function() {
    $("li.list").hover(function() {//hover(最初にカーソルの重なる場所)をここに書く).hover(function() {
      $("ul.category1").toggle();//hoverした時最初に開きたい場所を書く).toggle();
    });
    $("li.list li ul").hide();//hover(最初にカーソルの重なる場所)をここに書くli ul").hide();
    $("li.list li").hover(function() {//hover(最初にカーソルの重なる場所)をここに書く li").hover(function() {
        $(">ul:not(:animated)", this).stop(true, true).slideDown(0);
        $(">a", this).addClass("active");//link箇所をaで表しています, this).addClass("active");
    }, function() {//ul(カテゴリごとのテーブル)挙動がanimatedによって繰り返し続けてしまうのでstopをかけています
        $(">ul:not(:animated)", this).stop(true, true).slideUp(0);
        $(">a", this).removeClass("active");//link箇所をaで表しています, this).removeClass("active");
    });//今回link箇所には「親」「子」「孫」の名前が繰り返し表示されるような記述が入っているのでそこの部分がaddやremoveで出たり消えたりしていま
  }); //ulは各カテゴリのテーブル部分に当たるのでslideDownやslideUpで出たり消えたりします