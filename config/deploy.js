module.exports = {
  staging: {
    buildEnv: 'staging', // Override the environment passed to the ember asset build. Defaults to 'production'
    store: process.env['REDISCLOUD_URL'],
    assets: {
      accessKeyId: 'AKIAJLWG4LECUK2W4JBA',
      secretAccessKey: process.env['AWS_ACCESS_KEY'],
      bucket: 'octappus'
    },
    manifestPrefix: 'octappus-ui:staging:' // optional, defaults to this.project.name()
  },

   production: {
    store: process.env['REDISCLOUD_URL'],
    assets: {
      accessKeyId: 'AKIAJLWG4LECUK2W4JBA',
      secretAccessKey: process.env['AWS_ACCESS_KEY'],
      bucket: 'octappus'
    },
    manifestPrefix: 'octappus-ui'
  }
};
