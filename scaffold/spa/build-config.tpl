var epr = require( 'edp-provider-rider' );

exports.stylus = epr.stylus;
exports.input = __dirname;

var path = require( 'path' );
exports.output = path.resolve( __dirname, 'output' );

var stylusPlugin = epr.plugin();
exports.getProcessors = function () {
    var cssProcessor = new CssCompressor();
    var moduleProcessor = new ModuleCompiler();
    var jsProcessor = new JsCompressor();
    var pathMapperProcessor = new PathMapper();
    var addCopyright = new AddCopyright();
    var html2jsPorcessor = new Html2JsCompiler();
    var stylusProcessor = new StylusCompiler({
            stylus: epr.stylus,
            compileOptions: {
                use: stylusPlugin
            }
        });

    return {
        'default': [ stylusProcessor, html2jsPorcessor, moduleProcessor, pathMapperProcessor ],
        'release': [
            stylusProcessor, cssProcessor, html2jsPorcessor, moduleProcessor,
            jsProcessor, pathMapperProcessor, addCopyright
        ]
    };
};

exports.exclude = [
    'tool',
    'doc',
    'test',
    'module.conf',
    'dep/packages.manifest',
    'dep/*/*/test',
    'dep/*/*/doc',
    'dep/*/*/demo',
    'dep/*/*/tool',
    'dep/*/*/*.md',
    'dep/*/*/package.json',
    'edp-*',
    '.edpproj',
    '.svn',
    '.git',
    '.gitignore',
    '.idea',
    '.project',
    'Desktop.ini',
    'Thumbs.db',
    '.DS_Store',
    '*.tmp',
    '*.bak',
    '*.swp'
];

exports.injectProcessor = function ( processors ) {
    for ( var key in processors ) {
        global[ key ] = processors[ key ];
    }
};
