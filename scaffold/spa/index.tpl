<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta name="format-detection" content="telephone=no, email=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>${title}</title><!-- if: ${loader.url} -->
    <script src="${loader.url}"></script><!-- /if --><!-- if: ${loader.config} -->
    <script>
    require.config({<!-- if: ${loader.baseUrl} -->
        baseUrl: '${loader.baseUrl}',<!-- /if -->
        paths: {<!-- for: ${loader.paths} as ${path}, ${index} -->
            ${path.perfix}: '${path.data}'<!-- if: ${loader.paths.length} - 1 != ${index} -->,<!-- /if --><!-- /for -->
        },
        packages: [<!-- for: ${loader.packages} as ${pkg}, ${index} -->
            {
                name: '${pkg.name}',
                location: '${pkg.location}'<!-- if: ${pkg.main} -->,<!-- /if --><!-- if: ${pkg.main} -->
                main: '${pkg.main}'<!-- /if -->
            }<!-- if: ${loader.packages.length} - 1 != ${index} -->,<!-- /if --><!-- /for -->
        ]

    });
    </script><!-- /if -->
</head>

<body>

<div id="viewport"></div>

<script>
    require(['app'], function (app) {
        app.init();
    });
</script>
</body>
</html>
