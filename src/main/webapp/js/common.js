// 获取树状菜单基本数据
function getTreeData(baseUrl) {
    var data = [];
    $.ajax({
        url: baseUrl
        , type: "get"
        , async: false
        , success: function (result) {
            data = result;
        }
    });
    return data;
}