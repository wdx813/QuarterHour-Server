// 验证VIP
function vip_verify() {
    let vip_end_time = $("input[name='vip_end_time']").val();
    if (!vip_end_time) {
        layer.confirm('抱歉~您暂未是VIP用户，请到个人中心充值！', {title:'提示', icon: 5});
        return false;
    }

    if (Math.round(new Date().getTime()/1000) > vip_end_time) {
        layer.alert('抱歉~您的VIP已到期，请到个人中心充值！', {title:'提示', icon: 5});
        return false;
    }
    return true;
}


// VR详情
function vr_detail(vr_id) {
    if (!vip_verify()) return false;
    window.open('/home/case/get_vr_info?vr_id=' + vr_id);
}

function collect_detail(vr_id) {
    if (!vip_verify()) return false;
    window.open('/home/collect/detail?vr_id=' + vr_id);
}

// 进入VR
function open_vr(obj) {
    if (!vip_verify()) return false;

    let vr_src = $(obj).attr("data-src"),
        vr_title = $(obj).attr("data-title");
    layer.open({
        type: 2,
        title: vr_title,
        shadeClose: true,
        //shade: false,
        maxmin: true,
        area: ["900px", "600px"],
        content: vr_src
    });
}

// 禁用F12
document.onkeydown = function(){
    if(window.event && window.event.keyCode === 123) {
        event.keyCode=0;
        event.returnValue=false;
    }
    if(window.event && window.event.keyCode === 13) {
        window.event.keyCode = 505;
    }
    if(window.event && window.event.keyCode === 8) {
        alert(str+"\n请使用Del键进行字符的删除操作！");
        window.event.returnValue=false;
    }
};

// 禁止右键
document.oncontextmenu = function (event){
    if(window.event){
        event = window.event;
    }
    try{
        let the = event.srcElement;
        if (!((the.tagName === "INPUT" && the.type.toLowerCase() === "text") || the.tagName === "TEXTAREA")){
            return false;
        }
        return true;
    }catch (e){
        return false;
    }
}