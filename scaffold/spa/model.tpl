/**
 * @file ${name}
 * @author ${author.name}(${author.email})
 */

define(function (require) {

    var Resolver = require('saber-promise');

    var config = {};

    config.fetch = function () {
        return Resolver.resolved({});
    };

    return config;

});
