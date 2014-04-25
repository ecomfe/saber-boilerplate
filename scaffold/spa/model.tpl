/**
 * @file ${name}
 * @author ${author.name}(${author.email})
 */

define(function (require) {

    var Resolver = require('saber-promise');

    var config = {};

    config.fetch = function (query) {
        return Resolver.resolved(query);
    };

    return config;

});
