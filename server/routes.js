/**
 * Main application routes
 */

'use strict';

var errors = require('./components/errors');
var ghost = require('ghost');

module.exports = function(app) {

  // Insert routes below
  app.use('/api/things', require('./api/thing'));
  app.use('/api/users', require('./api/user'));

  app.use('/auth', require('./auth'));

  ghost().then(function (ghostServer) {
    app.use('/blog', ghostServer.rootApp);
    ghostServer.start(app);

  // All other routes should redirect to the index.html
    app.route('/*')
      .get(function(req, res) {
        res.sendfile(app.get('appPath') + '/index.html');
      });
    
    
  });
  
  // All undefined asset or api routes should return a 404
  app.route('/:url(api|auth|components|app|bower_components|assets)/*')
   .get(errors[404]);
};
