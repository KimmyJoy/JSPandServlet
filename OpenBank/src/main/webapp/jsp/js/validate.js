/*
회원가입 유효성 용도
*/
$(document).ready(function() {
    $('#signup-form').submit(function(e) {
        e.preventDefault();

        var id = $('#u_id').val();
        var pw = $('#u_pw').val();
        var nm = $('#u_nm').val();
        var num = $('#u_num').val();
        var email = $('#u_email').val();
        var identy = $('#u_identy').val();
        var add = $('#u_add').val();

        // 이곳에 유효성 검사 로직 추가

        $.ajax({
            url: '/your_validation_url',  // 서버 유효성 검사 URL
            type: 'POST',
            data: {
                u_id: id,
                u_pw: pw,
                u_nm: nm,
                u_num: num,
                u_email: email,
                u_identy: identy,
                u_add: add
            },
            success: function(data) {
                // 서버에서 유효성 검사가 통과된 경우, form 제출
                if (data.valid) {
                    $('#signup-form').off('submit').submit();
                } else {
                    alert(data.message);
                }
            },
            error: function(jqXHR, textStatus, errorThrown) {
                alert('Error occurred: ' + errorThrown);
            }
        });
    });
});

function addHyphen() {
    var identy = $('#u_identy').val();
    if (identy.length == 6) {
        $('#u_identy').val(identy + '-');
    }
}
