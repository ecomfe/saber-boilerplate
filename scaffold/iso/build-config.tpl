/**
 * @file build配置
 * @author edpx-mobile
 */

/* globals CssCompressor, ModuleCompiler, JsCompressor, PathMapper, Html2JsCompiler, StylusCompiler, OutputCleaner */

var cwd = process.cwd();
var path = require('path');

// 引入 rider 支持
var epr = require('./edp-rider-config');

// 引入 rebas 支持
var transfer = require('rebas-transfer');

/**
 * 指定匹配版本的 stylus
 */
exports.stylus = epr.stylus;

/**
 * 输入目录
 *
 * @type {string}
 */
exports.input = cwd;

/**
 * 输出目录
 *
 * @type {string}
 */
exports.output = path.resolve(cwd, 'output', 'static');

/**
 * rebas 构建配置
 *
 * @type {Object}
 */
exports.reabs = {
    // 输出的目录
    output: 'output/node',
    // 需要拷贝到输出目录的文件
    files: ['app.js', 'lib', 'node_modules'],
    // 主文件
    index: 'index.html',
    // 配置文件夹
    configDir: 'config'
};


/**
 * 排除文件pattern列表
 *
 * @type {Array}
 */
exports.exclude = [
    'tool',
    'doc',
    'test',
    'output',
    'module.conf',
    'package.json',
    'README',
    'dep/packages.manifest',
    'dep/*/*/demo',
    'dep/*/*/*.md',
    'edp-*',
    '.*',
    'node_modules',
    'Desktop.ini',
    'Thumbs.db',
    '*.tmp',
    '*.bak',
    '*.swp',
    '*.md5',
    /^app.js$/,
    /^log\//,
    /^config[\-a-zA-Z]*\//
];

/**
 * 获取构建processors的方法
 *
 * @return {Array}
 */
exports.getProcessors = function () {
    var cssProcessor = new CssCompressor();
    var moduleProcessor = new ModuleCompiler(
        transfer.combine({
            // 指定需要合并所有业务代码的入口模块
            entries: ['app']
        })
    );
    var jsProcessor = new JsCompressor();
    var pathMapperProcessor = new PathMapper();
    var html2jsPorcessor = new Html2JsCompiler({
        files: ['src/**/*.tpl'],
        extnames: 'tpl'
    });
    var stylusProcessor = new StylusCompiler({
        stylus: epr.stylus,
        compileOptions: {
            use: epr.stylusPlugin
        }
    });
    var outputCleaner = new OutputCleaner();

    return [
        stylusProcessor,
        cssProcessor,
        html2jsPorcessor,
        transfer.builder(),
        moduleProcessor,
        jsProcessor,
        pathMapperProcessor,
        outputCleaner
    ];
};

exports.moduleEntries = 'html,htm,phtml,tpl,vm,js';
exports.pageEntries = 'html,htm,phtml,tpl,vm';

/* eslint-disable guard-for-in */
exports.injectProcessor = function (processors) {
    for (var key in processors) {
        global[key] = processors[key];
    }
};
