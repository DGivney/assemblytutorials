$(document).ready(function() {

    $('p, li').html(function(i, v) {
        return v.replace(/\s(EAX|EBX|ECX|EDX|EBP|ESP|EDI|ESI){1}([^\s]*)/gi, ' <span class="register-name">$1$2</span>');
    }).html(function(i, v) {
        return v.replace(/(SYS_)([^\s]*)/gi, '<span class="function-name">$1$2</span>');
    }).html(function(i, v) {
        return v.replace(/\s(ADD|SUB|MOV|INT|RET|CMP|PUSH|POP|JMP)\s/gi, ' <span class="instruction-name">$1</span> ');
    });

});