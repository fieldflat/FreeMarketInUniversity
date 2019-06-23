$(document).on('turbolinks:load', function () {
    function buildMESSAGE(message) {
        if (message.content !== undefined){
            var content = `<li id="message-${message.id}" style="list-style: none; padding-bottom: 10px;" class="messages" data-id="${message.id}"><div class="text-left" style="width: 80%;"><div style=" width: 100%;  overflow: hidden;"><span class="image" id="to">${message.content}</span></div></div> </li>`
            $('.message').append(content);
            return content;
        }
    }

    $(function () {
        setInterval(update, 1000);
        //10000ミリ秒ごとにupdateという関数を実行する
    });

    function update() {
        var form = $('.js-form__text-field');
        var message = form.val();
        var url = location.href;
        var message_id = $('.messages:last').data('id');
        console.log(url);
        console.log(message);
        console.log(message_id)
        $.ajax({
            url: url,
            type: 'GET',
            data: {
                message: {
                    id: message_id
                }
            },
            dataType: 'json'
        })
        // .done(function (data) {
        //     var html = buildHTML(data);
        //     $('.messages').append(html);
        //     $('#message_content').val('');
        // })
        // .fail(function (data) {
        //     alert('エラーが発生したためメッセージは送信できませんでした。');
        // })
        .always(function (data) {
            $.each(data, function (i, data) { //'data'を'data'に代入してeachで回す
                buildMESSAGE(data); //buildMESSAGEを呼び出す
            });
        })
    }
});