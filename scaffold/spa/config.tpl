/**
 * @file 路由配置
 * @author ${author.name}(${author.email})
 */

define(function (require) {

    return [<!-- for: ${routes} as ${route}, ${index} -->
        ${route|raw}<!-- if:${routes.length} - 1 != ${index} -->,<!-- /if --><!-- /for -->
    ];

});
