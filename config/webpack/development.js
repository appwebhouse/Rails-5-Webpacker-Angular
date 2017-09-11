const merge = require('webpack-merge')
const environment = require('./environment')
const htmlLoader = require('./loaders/html')

module.exports = merge(environment.toWebpackConfig(), {
  module: {
    rules: [htmlLoader]
  }
})
