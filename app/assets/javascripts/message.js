$(document).on('turbolinks:load', function () {
    // Rails5を使っている方はturbolinksが悪さをしていることがあるので$(document).ready(function(){})ではなくturbolinksを初回読み込み、リロード、ページ切り替えで動くように上のように記述しましょう。
    // そうすることによってページを一回読み込まないと上手くいかないという事がなくなるはずです。
    // $(function(){})　＝　$(document).ready(function(){})です。
    $('#new_message').on('submit', function (e) {
        e.preventDefault();
        var message = new FormData(this); //フォームに入力した値を取得しています。
        var url = (window.location.href);
        $.ajax({
            url: url,
            type: 'POST',
            data: message,
            dataType: 'json',
            processData: false,
            contentType: false
        })
    })
});
