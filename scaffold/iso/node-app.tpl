/**
 * @file app
 * @author ${author.name}(${author.email})
 */

var app = require('rebas');
var path = require('path');
// 默认使用普通的ajax
// 如果需要使用ejson，请使用：
// var ajax = require('saber-ajax').ejson;
var ajax = require('saber-ajax');
var config = app.get('app');

ajax.config({
    host: config.remote,
    logger: app.logger
});

// 透传异步请求的HTTP Header
app.use(ajax, ['cookie', 'set-cookie']);

// 同步根路径与静态资源路径
app.setSyncData('root', config.root);
app.setSyncData('staticRoot', config.staticRoot);

// 加载路由信息
var routeInfo = require('./lib/config');
app.load(routeInfo);

app.after(function (req, res, next) {
    // 是否启动SPA模式
    // TODO
    // 根据访客终端来判断是否启用SPA模式
    if (res.hasOwnProperty('routeIndex')) {
        res.templateData.isSPA = true;
        res.templateData.presenter = routeInfo[res.routeIndex].action;
    }
    next();
});

var options = {

    basePath: path.resolve(__dirname, 'lib'),

    templateData: {
        config: {
            root: config.root,
            staticRoot: config.staticRoot
        }
    }

};

app.start(config.port, options);
