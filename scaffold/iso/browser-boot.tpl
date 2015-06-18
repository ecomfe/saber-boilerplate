/**
 * @file app
 * @author ${author.name}(${author.email})
 */

 define(function (require) {

    var app = require('saber-rainbow');
    var Resolver = require('saber-promise');

    // Only For Debug
    // 关闭Promise的异常捕获，方便调试
    Resolver.disableExceptionCapture();

    app.config({
        isomorphic: true
    });

    return function (config, path) {
        app.boot(config, path);
    };

});
