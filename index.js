/**
 * @file main
 * @author treelite(c.xinle@gmail.com)
 */

var fs = require('fs');
var path = require('path');

var DIR = path.resolve(__dirname, '/lib/scaffold');

exports.get = function (name) {
    var file = path.resolve(DIR, name, '.tpl');

    if (!fs.existsSync(file)) {
        throw new Error('can not find scaffold file: ' + name);
    }

    return fs.readFileSync(file, 'utf-8');
};
