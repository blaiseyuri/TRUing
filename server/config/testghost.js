// # Ghost bootloader
// Orchestrates the loading of Ghost
// When run from command line.

var express,
    ghost,
    parentApp,
    errors;
var ghostRoot = 'ghost';

// Make sure dependencies are installed and file system permissions are correct.
require(ghostRoot + '/core/server/utils/startup-check').check();

// Proceed with startup
express = require('express');
ghost = require(ghostRoot + '/core');
errors = require(ghostRoot + '/core/server/errors');

// Create our parent express app instance.
parentApp = express();

ghost().then(function (ghostServer) {
    // Mount our ghost instance on our desired subdirectory path if it exists.
    parentApp.use(ghostServer.config.paths.subdir, ghostServer.rootApp);

    // Let ghost handle starting our server instance.
    ghostServer.start(parentApp);
}).catch(function (err) {
    errors.logErrorAndExit(err, err.context, err.help);
});
