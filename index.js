/**
 * @file main
 * @author treelite(c.xinle@gmail.com)
 */

var fs = require('fs');
var path = require('path');

var DIR = path.resolve(__dirname, 'scaffold');

/**
 * 获取模版
 *
 * @public
 * @param {string} name 模版名称
 * @return {string}
 */
exports.get = function (name) {
    var file = path.resolve(DIR, name + '.tpl');

    if (!fs.existsSync(file)) {
        throw new Error('can not find scaffold file: ' + name);
    }

    return fs.readFileSync(file, 'utf-8');
};

/**
 * 获取配置信息
 *
 * @public
 * @param {string} name 模版名称
 * @return {Object} 配置信息
 */
exports.getConfig = function (name) {
    var res = {};
    var file = path.resolve(DIR, name + '.json');

    if (fs.existsSync(file)) {
        res = JSON.parse(fs.readFileSync(file, 'utf-8'));
    }

    return res;
};

/**
 * 生成文件
 *
 * @public
 * @param {string} name 模版名称
 * @param {string} output 生成文件路径
 * @param {Object=} data 模版数据
 */
exports.generate = function (name, output, data) {
    var etpl = require('etpl');
    var mkdirp = require('mkdirp');
    var tpl = exports.get(name);
    var tplEngine = new etpl.Engine(exports.getConfig(name));
    var render = tplEngine.compile(tpl);
    var file = render(data || {});

    var dir = path.dirname(output);
    if (!fs.existsSync(dir)) {
        mkdirp.sync(dir);
    }

    fs.writeFileSync(output, file, 'utf-8');
};
