/**
 * @file watch配置
 * @author edpx-mobile
 */

/* globals livereload */

exports.baseDir = __dirname;

var globalFilters = {
    ignoreNodeModules: '!(node_modules/*|*/node_modules/*)',
    ignoreEdpPackages: '!dep/*',
    ignoreVCSFiles   : '!(*).(git|svn|idea)/*',
    ignoreIDEFiles   : '!(*).(DS_Store)',
    ignoreNodeConfig : '!(*)(.gitignore|packkage.json|*.md)'
};

var commonFilters = {
    staticFiles: '*.(tpl|html|js|coffee|less|styl|css|xml)',
    mediaFiles: '*.(gif|jpg|jpeg|png|swf|fla|mp3|ttf|woff|woff2)'
};

exports.globalFilters = globalFilters;

exports.getTasks = function () {
    return {
        'livereload': {
            filters: [
                commonFilters.staticFiles,
                commonFilters.mediaFiles
            ],
            events: [
                'addedFiles',
                'modifiedFiles'
            ],
            plugins: livereload(),
            intervalTime: 3000
        }
    };
};

exports.getGroups = function () {
    return {
        'default': ['livereload']
    };
};

/* eslint-disable guard-for-in */
exports.injectPlugin = function (plugins) {
    for (var key in plugins) {
        global[key] = plugins[key];
    }
};
