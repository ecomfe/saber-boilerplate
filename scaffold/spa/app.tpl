/**
 * @file app
 * @author ${author}(${email})
 */

define(function (require) {

    var Resolver = require('saber-promise');
    var firework = require('saber-firework');

    // FIXME
    // Only For Debug
    Resolver.disableExceptionCapture();

    // saber-firework全局配置信息
    var config = {};

    // 加载路由配置
    firework.load(require('./config'));

    // 启动应用
    firework.start('viewport', config);

});
