/**
 * @file WebServer 配置
 * @author edpx-mobile
 */

/* globals autostylus, proxy, file */

// 引入 rider 支持
var epr = require('./edp-rider-config');

// 引入 rebas 支持
var transfer = require('rebas-transfer');

// 指定匹配版本的 stylus
exports.stylus = epr.stylus;

// 端口
exports.port = 8848;

// 网站根目录
exports.documentRoot = process.cwd();

// 当路径为目录时，是否显示文件夹内文件列表
exports.directoryIndexes = true;

/* handlers
 * 支持expressjs的path的写法，可以通过request.parameters来获取url中的参数
 * 如:
 *  {
 *      location: '/lib/:filename',
 *      handler: function(context) {
 *          console.log(context.request.parameters);
 *      }
 *  }
 *
 * 如果访问http://127.0.0.1:8848/lib/config.js
 *  handler将打印出{"filename": "config.js"}
 */
exports.getLocations = function () {
    return [
        {
            location: /^[^\?]+?\.css($|\?)/,
            handler: [
                autostylus({
                    stylus: epr.stylus,
                    use: epr.stylusPlugin
                })
            ]
        },
        {
            location: /^\/[^.]*$/,
            handler: [
                proxy('127.0.0.1', '8000')
            ]
        },
        {
            location: /^.*$/,
            handler: [
                file(),
                transfer.server()
            ]
        }
    ];
};

/* eslint-disable guard-for-in */
exports.injectResource = function (res) {
    for (var key in res) {
        global[key] = res[key];
    }
};
