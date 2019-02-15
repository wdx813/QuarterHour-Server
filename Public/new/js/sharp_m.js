/**
 一刻钟
 */
// 验证码倒计时
let state_ = true;
// 修改密码--获取验证码
$('.change_pwd .h1').click(function () {
    let phone = $("input[name='phone']").val().trim();
    if(phone == "") {
        return layer.msg("请输入手机号~", {time: 1500});
    }
    if (!(/^1[34578]\d{9}$/.test(phone))) {
        return layer.msg("请输入有效的手机号~", {time: 1500});
    }
    // 倒计时
    timer(this);
    // 发送验证码
    let data = {"phone" : phone, "type" : 2};
    sms_send(data);
    return false;
});

// 修改手机号--获取验证码
$('.yzm_sj .h1').click(function () {
    let phone = $("input[name='old_phone']").val().trim();
    if(phone == "") {
        return layer.msg("请输入手机号~", {time: 1500});
    }
    if (!(/^1[34578]\d{9}$/.test(phone))) {
        return layer.msg("请输入有效的手机号~", {time: 1500});
    }
    // 倒计时
    timer(this);
    // 发送验证码
    let data = {"phone" : phone, "type" : 3};
    sms_send(data);
    return false;
});

$('.sxg_sj .h1').click(function () {
    let phone = $("input[name='new_phone']").val().trim();
    if(phone == "") {
        return layer.msg("请输入手机号~", {time: 1500});
    }
    if (!(/^1[34578]\d{9}$/.test(phone))) {
        return layer.msg("请输入有效的手机号~", {time: 1500});
    }
    // 倒计时
    timer(this);
    // 发送验证码
    let data = {"phone" : phone, "type" : 3};
    sms_send(data);
    return false;
});

// 倒计时
let timer = function (obj) {
    let s = 60;
    let now_btn = $(obj);
    if (state_) {
        now_btn.text(s + 'S后重发');
        let c_time = setInterval(function () {
            s--;
            now_btn.text(s + 'S后重发');
            if (s < 1) {
                clearInterval(c_time);
                state_ = true;
                now_btn.text('获取验证码');
            }
        }, 1000);
    }
    state_ = false;
};

// 发送短信验证码
let sms_send = function (data) {
    $.ajax({
        url: "/home/index/sms_send",
        type: "POST",
        dataType: "JSON",
        data: data,
        success: function (res) {
            if(res.result_code == 400) {
                layer.msg(res.result_msg);
            }
        },
        error: function () {
            layer.msg("验证码获取失败~");
        }
    });
};


// 我的收藏
let fn_, sn_, order_, str_;
// 收藏  点击编辑
$('.collection_ul .edi').click(function () {
    // 隐藏按钮
    $(this).parents('li').find('.del').hide();
    $(this).hide();

    $(this).siblings('.t_btn').addClass('on');
    $(this).parents('li').find('.ss').attr('disabled', false).addClass('ee');
    fn_ = $(this).parents('li').find('.fn').val();
    sn_ = $(this).parents('li').find('.sn').val();
    order_ = $(this).parents('li').find('.oo').val();
    str_ = $(this).parents('li').find('textarea').val();
});
// 收藏  点击保存
$('.collection_ul .t_btn em.yes').click(function () {
    // 显示按钮
    $(this).parents('li').find('.del').show();
    $(this).parents('li').find('.edi').show();

    // 最小价格
    let fn = $(this).parents('li').find('.fn').val().trim();
    // 最大价格
    let sn = $(this).parents('li').find('.sn').val().trim();
    // 排序
    let sort = $(this).parents('li').find('.oo').val().trim();
    // 描述
    let str = $(this).parents('li').find('textarea').val().trim();
    // 作品ID
    let vr_id = $(this).attr("data-vr-id");

    if ($(this).parents('li').find('.fn').val() == '') {
        $(this).parents('li').find('.fn').val(0);
    }
    if ($(this).parents('li').find('.sn').val() == '') {
        $(this).parents('li').find('.sn').val(0);
    }
    if ((sn - fn) < 1) {
        parent.layer.alert("价格输入错误，请重新输入");
        return false;
    }
    $(this).parent().removeClass('on');
    $(this).parent().siblings('.edi').removeClass('on');
    $(this).parents('li').find('.ss').attr('disabled', 'disabled').removeClass('ee');

    let data = {"my_min_price" : fn, "my_max_price" : sn, "sort" : sort, "my_description" : str, "vr_id" : vr_id};
    $.post("/home/center/collect_edit", data, function (res) {
        if(res && res.result_code == 400) {
            $('.collection_ul .t_btn em.no').click();
        }
    });

});

// 收藏  点击取消
$('.collection_ul .t_btn em.no').click(function () {
    fn = $(this).parents('li').find('.fn').val(fn_);
    fn = $(this).parents('li').find('.sn').val(sn_);
    fn = $(this).parents('li').find('.oo').val(order_);
    fn = $(this).parents('li').find('textarea').val(str_);
    $(this).parent().removeClass('on');
    $(this).parent().siblings('.edi').removeClass('on');
    $(this).parents('li').find('.ss').attr('disabled', 'disabled').removeClass('ee');

    // 显示按钮
    $(this).parents('li').find('.del').show();
    $(this).parents('li').find('.edi').show();
});

// 取消收藏
$('.collection_ul .del').click(function () {
    let vr_id = $(this).attr("data-vr-id"),
        that = this;
    $.post("/home/collect/add_or_cancel", {"vr_id" : vr_id}, function (res) {
        console.log(res);
        if(res && res.result_code === 200) {
            $(that).parents('li').remove();
        }
    })
});

// 切换主题
$('#change_btn').click(function () {
    let that = this;
    $.get("/home/center/change_theme", function (res) {
        if(res && res.result_code == 200) {
            $(that).parents('.header').css('background-image', 'url(/Public/new/banner/banner' + res.theme + '.jpg)');
        }
    });
});

