/* jshint node: true */

module.exports = function(environment) {
  var ENV = {
    modulePrefix: 'frontend',
    environment: environment,
    baseURL: '/',
    locationType: 'auto',
    EmberENV: {
      FEATURES: {
        // Here you can enable experimental features on an ember canary build
        // e.g. 'with-controller': true
      }
    },

    contentSecurityPolicy: {
      'default-src': "'none'",
      'script-src': "'self' 'unsafe-inline' 'unsafe-eval' cloudfront.net stripe.com fast.wistia.com use.typekit.net connect.facebook.net maps.googleapis.com maps.gstatic.com 'unsafe-inline' https://*.auth0.com octappus.auth0.com",
      'font-src': "'self' https://fonts.gstatic.com data: cloud.typography.com https://maxcdn.bootstrapcdn.com/ https://*.auth0.com",
      'connect-src': "'self' http://localhost:* octappus.auth0.com http://our_club_tracker.dev",
      'img-src': "'self' https://robohash.org/ http://robohash.org/ *.gravatar.com *.wp.com data:",
      'style-src': "'self' 'unsafe-inline' https://fonts.googleapis.com https://maxcdn.bootstrapcdn.com/",
      'frame-src': "s-static.ak.facebook.com static.ak.facebook.com www.facebook.com",
    },
    
    APP: {
      // Here you can pass flags/options to your application instance
      // when it is created
    }
  };
  
  ENV['ember-simple-auth'] = {
    authenticationRoute: 'index',
    routeAfterAuthentication: 'protected',
    routeIfAlreadyAuthenticated: 'protected'
  };
  
  ENV['auth0-ember-simple-auth'] = {
    clientID: "jy56Qyf1kpnoFkrRbiTB68UzXYRrvSbg",
    domain: "octappus.auth0.com"
  }

  if (environment === 'development') {
    //ENV.APP.LOG_RESOLVER = true;
    // ENV.APP.LOG_ACTIVE_GENERATION = true;
    ENV.APP.LOG_TRANSITIONS = true;
    // ENV.APP.LOG_TRANSITIONS_INTERNAL = true;
    // ENV.APP.LOG_VIEW_LOOKUPS = true;
  }

  if (environment === 'test') {
    // Testem prefers this...
    ENV.baseURL = '/';
    ENV.locationType = 'none';

    // keep test console output quieter
    ENV.APP.LOG_ACTIVE_GENERATION = false;
    ENV.APP.LOG_VIEW_LOOKUPS = false;

    ENV.APP.rootElement = '#ember-testing';
  }

  if (environment === 'production') {

  }

  return ENV;
};
