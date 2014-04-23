/**
 * @file 路由配置
 * @author ${author}(${email})
 */

define(function (require) {

    return [
        <!-- for: ${routes} as ${route}, ${index} -->
        {path: '${route.path}', action: require('${route.action}')}<!-- if:${routes.length} - 1 != ${index} -->,<!-- /if -->
        <!-- /for -->
    ];

});
