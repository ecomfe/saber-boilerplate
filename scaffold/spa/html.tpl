<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no, minimal-ui">
    <meta name="format-detection" content="telephone=no">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <title>${title}</title>
    <!-- if: ${loaderUrl} -->
    <script src="${loaderUrl}"></script>
    <!-- /if -->
    <!-- if: ${loaderConfig} -->
    <script>
    require.config({
        baseUrl: '${loaderBaseUrl}',
        paths: {
            <!-- for: ${loaderPaths} as ${path}, ${index} -->
            ${path.perfix}: '${path.data}'<!-- if: ${loaderPaths.length} - 1 != ${index} -->,<!-- /if -->
            <!-- /for -->
        },
        packages: [
            <!-- for: ${loaderPackages} as ${pkg}, ${index} -->
            {
                name: '${pkg.name}',
                location: '${pkg.location}'<!-- if: ${pkg.main} -->,<!-- /if -->
                <!-- if: ${pkg.main} -->
                main: '${pkg.main}'
                <!-- /if -->
            }<!-- if: ${loaderPackages.length} - 1 != ${index} -->,<!-- /if -->
            <!-- /for -->
        ]
    });
    </script>
    <!-- /if -->
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
