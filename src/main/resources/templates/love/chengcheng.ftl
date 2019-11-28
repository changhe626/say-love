<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xml:lang="en" xmlns="http://www.w3.org/1999/xhtml"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>程程老师,你好</title>
        <link type="text/css" rel="stylesheet" href="/static/user/css/default.css">
        <script type="text/javascript" src="/static/user/js/jquery.min.js"></script>
        <script type="text/javascript" src="/static/user/js/jscex.min.js"></script>
        <script type="text/javascript" src="/static/user/js/jscex-parser.js"></script>
        <script type="text/javascript" src="/static/user/js/jscex-jit.js"></script>
        <script type="text/javascript" src="/static/user/js/jscex-builderbase.min.js"></script>
        <script type="text/javascript" src="/static/user/js/jscex-async.min.js"></script>
        <script type="text/javascript" src="/static/user/js/jscex-async-powerpack.min.js"></script>
        <script type="text/javascript" src="/static/user/js/functions.js" charset="utf-8"></script>
        <script type="text/javascript" src="/static/user/js/love.js" charset="utf-8"></script>
    </head>
    <body>
        <div id="main">
            <div id="wrap">
               <div id="text">
                    <div id="code">                 
                    <span class="say">不知道远端的程程睡着了没有?应该没有失眠吧,我却睡不着,也不知道写些什么,就随便写点吧</span><br>
                    <span class="say">我们相识于网络,聊天,感觉很舒服,第一次因为我的误会没见面,然后我专门请假才得一睹芳容,不容易</span><br>
                    <span class="say">头一次为了见一个人专门去请假.哈哈哈,也是值得的</span><br>
                    <span class="say">这么长时间的相处下来,你是一个很漂亮,很善良,正直无阿,会种花花草草,会勤快的给花花草草换土,懂得和欣赏生活,还会弹吉他,</span><br>
                    <span class="say">一位有爱心的老师,爱护小朋友,持续的学习进步,有时候还有点调皮,会不会说太多了,然后就很骄傲了,哈哈哈</span><br>
                    <span class="say">和你一起去吃饭,看电影,逛华科都是很开心的.</span><br>
                    <span class="say">我保证你会好好的,我们一起去吃炒肥肠,吃板栗烧鸡,吃蛋炒小葱</span><br>
                    <span class="say">All Weather With You</span><br>
                   <br>
                    <span class="say" style="color: red"><span class="space"></span> --Yours, 此刻正在想你的我.</span>
                    </div>
                </div>
                <div id="clock-box">
                    <a href="http://blog.csdn.net/u010398771" target="_blank">程程</a> 与 <a href="http://blog.csdn.net/u010398771" target="_blank">科</a> 认识
                        <div id="clock"></div>
                </div>
                <canvas id="canvas" width="1100" height="680"></canvas>
            </div>
            <audio src="/static/user/mp3/love.mp3" autoplay="autoplay"></audio>
        </div>
    
    <script>
    </script>

    <script>
    (function(){
        var canvas = $('#canvas');

        if (!canvas[0].getContext) {
            $("#error").show();
            return false;
        }

        var width = canvas.width();
        var height = canvas.height();
        
        canvas.attr("width", width);
        canvas.attr("height", height);

        var opts = {
            seed: {
                x: width / 2 - 20,
                color: "rgb(190, 26, 37)",
                scale: 2
            },
            branch: [
                [535, 680, 570, 250, 500, 200, 30, 100, [
                    [540, 500, 455, 417, 340, 400, 13, 100, [
                        [450, 435, 434, 430, 394, 395, 2, 40]
                    ]],
                    [550, 445, 600, 356, 680, 345, 12, 100, [
                        [578, 400, 648, 409, 661, 426, 3, 80]
                    ]],
                    [539, 281, 537, 248, 534, 217, 3, 40],
                    [546, 397, 413, 247, 328, 244, 9, 80, [
                        [427, 286, 383, 253, 371, 205, 2, 40],
                        [498, 345, 435, 315, 395, 330, 4, 60]
                    ]],
                    [546, 357, 608, 252, 678, 221, 6, 100, [
                        [590, 293, 646, 277, 648, 271, 2, 80]
                    ]]
                ]] 
            ],
            bloom: {
                num: 700,
                width: 1080,
                height: 650,
            },
            footer: {
                width: 1200,
                height: 5,
                speed: 10,
            }
        }

        var tree = new Tree(canvas[0], width, height, opts);
        var seed = tree.seed;
        var foot = tree.footer;
        var hold = 1;

        canvas.click(function(e) {
            var offset = canvas.offset(), x, y;
            x = e.pageX - offset.left;
            y = e.pageY - offset.top;
            if (seed.hover(x, y)) {
                hold = 0; 
                canvas.unbind("click");
                canvas.unbind("mousemove");
                canvas.removeClass('hand');
            }
        }).mousemove(function(e){
            var offset = canvas.offset(), x, y;
            x = e.pageX - offset.left;
            y = e.pageY - offset.top;
            canvas.toggleClass('hand', seed.hover(x, y));
        });

        var seedAnimate = eval(Jscex.compile("async", function () {
            seed.draw();
            while (hold) {
                $await(Jscex.Async.sleep(10));
            }
            while (seed.canScale()) {
                seed.scale(0.95);
                $await(Jscex.Async.sleep(10));
            }
            while (seed.canMove()) {
                seed.move(0, 2);
                foot.draw();
                $await(Jscex.Async.sleep(10));
            }
        }));

        var growAnimate = eval(Jscex.compile("async", function () {
            do {
                tree.grow();
                $await(Jscex.Async.sleep(10));
            } while (tree.canGrow());
        }));

        var flowAnimate = eval(Jscex.compile("async", function () {
            do {
                tree.flower(2);
                $await(Jscex.Async.sleep(10));
            } while (tree.canFlower());
        }));

        var moveAnimate = eval(Jscex.compile("async", function () {
            tree.snapshot("p1", 240, 0, 610, 680);
            while (tree.move("p1", 500, 0)) {
                foot.draw();
                $await(Jscex.Async.sleep(10));
            }
            foot.draw();
            tree.snapshot("p2", 500, 0, 610, 680);

            //(＞﹏＜)
            canvas.parent().css("background", "url(" + tree.toDataURL('image/png') + ")");
            canvas.css("background", "#ffe");
            $await(Jscex.Async.sleep(300));
            canvas.css("background", "none");
        }));

        var jumpAnimate = eval(Jscex.compile("async", function () {
            var ctx = tree.ctx;
            while (true) {
                tree.ctx.clearRect(0, 0, width, height);
                tree.jump();
                foot.draw();
                $await(Jscex.Async.sleep(25));
            }
        }));

        var textAnimate = eval(Jscex.compile("async", function () {
            var together = new Date();
            // 设置时间, 年月日,
            // 注意了 这里的月份要比正确时间减去1 , 原来是2019.10.21. 这里写2019,9,21
            together.setFullYear(2019,9,21);
            together.setHours(16);//小时
            together.setMinutes(1);//分钟
            together.setSeconds(1);//秒
            together.setMilliseconds(520);//微秒

            $("#code").show().typewriter();
            $("#clock-box").fadeIn(500);
            while (true) {
                timeElapse(together);
                $await(Jscex.Async.sleep(1000));
            }
        }));

        var runAsync = eval(Jscex.compile("async", function () {
            $await(seedAnimate());
            $await(growAnimate());
            $await(flowAnimate());
            $await(moveAnimate());

            textAnimate().start();

            $await(jumpAnimate());
        }));

        runAsync().start();
    })();
    </script>



</body></html>