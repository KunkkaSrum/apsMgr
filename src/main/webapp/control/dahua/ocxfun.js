var gWndId = 0;
var nDirect = -1;
var nOper = -1;
var gXmlRecords;
var gRecordPath;
var bLogin = 0;
var bIVS = 1;

function init() {
    var obj = document.getElementById("DPSDK_OCX");
    gWndId = obj.DPSDK_CreateSmartWnd(0, 0, 100, 100);
    ButtonCreateWnd_onclick();
    //ButtonLogin_onclick();
    //ButtonStartRealplayByWndNo_onclick();
    //obj.DPSDK_SetLog(2, "D:/DPSDK_OCX_log", false, false); //初始化后设置日志路径
    //var obj = document.getElementById("DPSDK_OCX");
    //ShowCallRetInfo(obj.DPSDK_Login("172.7.123.123", 9000, "1", "1"), "登录");
    //ShowCallRetInfo(obj.DPSDK_AsyncLoadDGroupInfo(), "异步加载组织结构");
    //var nWndNo = obj.DPSDK_GetSelWnd(gWndId);
    //ShowCallRetInfo(obj.DPSDK_DirectRealplayByWndNo(gWndId, nWndNo, "1000001$1$0$0", 1, 1, 1), "直接实时播放");
    //for(var i=1;i<=4;i++)
    //  obj.DPSDK_SetToolBtnVisible(i, false);
    //obj.DPSDK_SetToolBtnVisible(7, false);
    //obj.DPSDK_SetToolBtnVisible(9, false);
    //obj.DPSDK_SetControlButtonShowMode(1, 0);
    //obj.DPSDK_SetControlButtonShowMode(2, 0);
}

//设置窗口数量及选中指定窗口
function ButtonCreateWnd_onclick() {
    var obj = document.getElementById("DPSDK_OCX");
    obj.DPSDK_SetWndCount(gWndId, 6);
    obj.DPSDK_SetSelWnd(gWndId, 0);
}

//登录平台
function ButtonLogin_onclick(ip, post, username, password) {
    var obj = document.getElementById("DPSDK_OCX");
    //var szIp = document.getElementById("textIP").value;
    //var nPort = document.getElementById("textPort").value;
    //var szUsername = document.getElementById("textUser").value;
    //var szPassword = document.getElementById("textPassword").value;

    var nRet = obj.DPSDK_Login(ip, post, username, password);
    ShowCallRetInfo(nRet, "登录");
    if (nRet === 0) {
        bLogin = 1;
    }
    // ButtonLoadDGroupInfo_on_click();
}

//登出平台
function ButtonLogout_onclick() {
    var obj = document.getElementById("DPSDK_OCX");
    if (bLogin === 1) {
        ShowCallRetInfo(obj.DPSDK_Logout(), "登出");
        bLogin = 0;
    }
}

//播放实时视频
function ButtonStartRealplayByWndNo_onclick() {
    var obj = document.getElementById("DPSDK_OCX");
    //var szCameraId = document.getElementById("textCameraID").value;
    //var nStreamType = document.getElementById("selectStreamType").value;
    //var nMediaType = document.getElementById("selectMediaType").value;
    //var nTransType = document.getElementById("selectTransType").value;

    var nWndNo = obj.DPSDK_GetSelWnd(gWndId);
    var nRet = obj.DPSDK_StartRealplayByWndNo(gWndId, nWndNo, "1000004$1$0$3", 1, 1, 1);
    ShowCallRetInfo(nRet, "播放视频");
    if (nRet === 0) {
        insertRealplayHistory(szCameraId);
        ShowCallRetInfo(obj.DPSDK_SetIvsShowFlagByWndNo(gWndId, nWndNo, 1, bIVS), "规则线显示");//打开规则线显示
        ShowCallRetInfo(obj.DPSDK_SetIvsShowFlagByWndNo(gWndId, nWndNo, 2, bIVS), "目标框显示");//打开目标框显示
        ShowCallRetInfo(obj.DPSDK_SetIvsShowFlagByWndNo(gWndId, nWndNo, 3, bIVS), "轨迹线显示");//打开轨迹线显示
    }
}

//按时间查询录像
function ButtonQueryRecord_onclick() {
    var obj = document.getElementById("DPSDK_OCX");
    var szCameraId = document.getElementById("textCameraID").value;
    var nRecordSource = document.getElementById("selectRecordSource").value;
    var nRecordType = document.getElementById("selectRecordType").value;
    var strStartTime = document.getElementById("textStartTime").value;
    var strEndTime = document.getElementById("textEndTime").value;
    var nStartTime = getDate(strStartTime).getTime() / 1000;
//	alert(nStartTime);
    var nEndTime = getDate(strEndTime).getTime() / 1000;
//	alert(nEndTime);	
//    ShowCallRetInfo(obj.DPSDK_QueryRecordInfo(szCameraId, nRecordSource, nRecordType, nStartTime, nEndTime), "查询录像");
//	gXmlRecords = obj.DPSDK_QueryRecordInfo(szCameraId, nRecordSource, nRecordType, nStartTime, nEndTime);
    obj.DPSDK_QueryRecordInfo(szCameraId, nRecordSource, nRecordType, nStartTime, nEndTime);
}

//按时间播放录像
function ButtonStartTimePlaybackByWndNo_onclick() {
    var obj = document.getElementById("DPSDK_OCX");
    var nWndNo = obj.DPSDK_GetSelWnd(gWndId);
    //视频通道ID
    var szCameraId = "1000000$1$0$0";
    //录像来源类型，2设备，3平台
    var nSourceType = 2;
    //录像类型,0全部
    var nRecordType = 0;
    //开始时间，例如2014/9/4 0:00:00,需要转换成长整型：1409760000
    var nStartTime = 140976000;
    //结束时间，例如2014/9/4 12:12:12,需要转换成长整型：1409803932
    var nEndTime = 1409803932;
    var result = obj.DPSDK_StartTimePlaybackByWndNo(gWndId, nWndNo, szCameraId, nSourceType,
        nBeginTime, nEndTime);
    if (result === 0) {
        //成功,TODO……
        ShowCallRetInfo("开始播放");
    }
    else {
        //失败打印错误码,TODO……
        ShowCallRetInfo("播放失败");
    }
}

//显示流程信息
function ShowCallRetInfo(nRet, strInfo) {
    var str = "";
    if (nRet === 0) {
        str = strInfo + " 成功！";
    }
    else {
        str = strInfo + "失败！错误码：" + nRet;
    }
    document.getElementById("RetInfo").innerText = str;
}

//加载组织结构信息
function ButtonLoadDGroupInfo_onclick() {
    var obj = document.getElementById("DPSDK_OCX");
    var result = obj.DPSDK_LoadDGroupInfo();
}

