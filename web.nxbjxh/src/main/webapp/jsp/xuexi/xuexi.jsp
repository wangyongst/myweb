<%@ page language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <%@ include file="/jsp/base.jsp" %>

    <script src="jwplayer/jwplayer.js"></script>
    <script src="jwplayer/jwplayer.loader.swf"></script>
    <!--这是KEY-->
    <script>jwplayer.key = "K1FkbLwx4yev30aJnbBUge9Yz8CQ25BWxo5a9Q==";</script>
    <title>宁夏保健学会学习平台-在线学习</title>
    <script type="text/javascript">
        $(function () {

            makeModal($("#jiangyiModal"), "jiangyi", "1");

            $("#jiangyi").click(function () {
                $('#jiangyiModal').find('.modal-title').text('课程讲义');
                $('#jiangyiModal').attr("class","modal fade bs-example-modal-lg");
                $('#jiangyiModal').children().attr("class","modal-dialog modal-lg");
                $('#jiangyiModal').find('.modal-body').children().remove();
                $('#jiangyiModal').find('.modal-body').append('<embed src="${currentLesson.pdf}" width="100%" height="600px"> </embed> ');
                $('#jiangyiSave').remove();
                $('#jiangyiModal').modal('toggle');
            });
        });

    </script>

</head>

<body>

<nav class="navbar navbar-default navbar-static-top" role="navigation">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">点击展开菜单</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="framework/home.do">宁夏保健学会学习平台</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="xuexi/update.do">修改个人信息 </a></li>
                <li class="active"><a href="xuexi/home.do">在线学习<span class="sr-only">(current)</span></a></li>
                <li><a href="xuexi/xuefen.do">申请学分 </a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="framework/logout.do">退出学习平台</a></li>
            </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>

<div class="row">
    <div class="col-md-10 col-md-offset-1">
        <div class="panel panel-primary">
            <div class="panel-heading">在线学习</div>
            <div class="panel-body">
                <div class="row">
                    <div class="col-md-6 media">
                        <div id='myplayer'></div>
                        <script type='text/javascript'>
                            jwplayer('myplayer').setup({
                                file: '${currentLesson.url}',
                                width: '640',
                                height: '480',
                                autostart:true
                            });
                        </script>
                    </div>
                    <div class="col-md-6 panel panel-success">
                        <div class="panel-heading">课程介绍</div>
                        <div class="panel-body">
                            <span>主讲人:</span>${currentLesson.teacher}
                            <br>
                            <br>
                            <span>课程编号:</span>${currentCourse.itemno}
                            <br>
                            <br>
                            <span>主讲单位:</span>${currentCourse.unit}
                            <br>
                            <br>
                            <span>课程介绍:</span>${currentLesson.introduce}
                        </div>
                    </div>
                    <div class="btn-group" role="group">
                        <button id="jiangyi" type="button" class="btn btn-success">课程讲义</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button id="test" type="button" class="btn btn-success">学习测验</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div><!--/.col-->
</div><!-- /.row -->
<div id="jiangyiModal"></div><!-- Modal -->
</body>

</html>