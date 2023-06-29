/*
회원가입 유효성 용도
*/
$(document).ready(function() {
    // 폼 제출 시 유효성 검사
    $("#signup-form").submit(function(event) {
        event.preventDefault(); // 폼 제출 이벤트 막기

        // AJAX를 통해 서버로 유효성 검사 요청
        $.ajax({
            url: "validateUser.jsp", // 유효성 검사를 수행할 JSP 페이지 경로
            method: "POST",
            data: $(this).serialize(), // 폼 데이터 직렬화하여 전송
            dataType: "json",
            success: function(response) {
                // 유효성 검사 결과를 받아 처리
                if (response.valid) {
                    // 유효성 검사 통과 시 폼 제출
                    $("#signup-form")[0].submit();
                } else {
                    // 유효성 검사 실패 시 오류 메시지를 표시
                    displayErrors(response.errors);
                }
            }
        });
    });
});

        // 이곳에 유효성 검사 로직 추가
		 if (!id) {
            $('#u_id-error').text('ID를 입력해 주세요.').show();
            return false;
        } else {
            $('#u_id-error').hide();
        }
		 if (!pw) {
            $('#u_pw-error').text('비밀번호를 입력해 주세요.').show();
            return false;
        } else {
            $('#u_pw-error').hide();
        }
		 if (!nm) {
            $('#u_nm-error').text('이름을 입력해 주세요.').show();
            return false;
        } else {
            $('#u_nm-error').hide();
        }
		 if (!num) {
            $('#u_num-error').text('번호를 입력해 주세요.').show();
            return false;
        } else {
            $('#u_num-error').hide();
        }
		 if (!email) {
            $('#u_email-error').text('이메일을 입력해 주세요.').show();
            return false;
        } else {
            $('#u_email-error').hide();
        }
		 if (!identy) {
            $('#u_identy-error').text('주민번호를 입력해 주세요.').show();
            return false;
        } else {
            $('#u_identy-error').hide();
        }
		 if (!add) {
            $('#u_add-error').text('주소를 입력해 주세요.').show();
            return false;
        } else {
            $('#u_add-error').hide();
        }
		
		// 오류 메시지를 표시하는 함수
function displayErrors(errors) {
    $(".error").hide(); // 기존 오류 메시지 숨기기

    $.each(errors, function(field, message) {
        $("#" + field + "-error").text(message).show(); // 해당 필드에 오류 메시지 표시
    });
}

      /*  $.ajax({
            url: '/OpenBank/src/main/java/joybank/controller/user/InsertUserController.java',  // 서버 유효성 검사 URL
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
}*/
