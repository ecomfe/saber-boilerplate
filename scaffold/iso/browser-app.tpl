/**
 * @file app
 * @author ${author.name}(${author.email})
 */

define(function (require) {

    var Resolver = require('saber-promise');
    var app = require('saber-firework');

    // 启用同构模式
    require('saber-firework/extension/isomorphic');

    // FIXME
    // Only For Debug
    // 关闭Promise的异常捕获，方便调试
    Resolver.disableExceptionCapture();

    // saber-firework全局配置信息
    var config = {
        root: app.getSyncData('root')
    };

    // 加载路由配置
    app.load(require('./config'));

    return function () {
        // 启动应用
        app.start('viewport', config);
    };

});
