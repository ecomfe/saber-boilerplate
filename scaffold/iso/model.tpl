/**
 * @file ${name}
 * @author ${author.name}(${author.email})
 */

var Resolver = require('saber-promise');

var config = {};

config.fetch = function (query) {
    return Resolver.resolved(query);
};

module.exports = config;
