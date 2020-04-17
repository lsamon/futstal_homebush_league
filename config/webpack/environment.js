const { environment } = require('@rails/webpacker')

var webpack = require('webpack');environment.plugins.append(
  'Provide',
	new webpack.ProvidePlugin({
    $: "jquery",
    jQuery: "jquery",
    "window.jQuery": "jquery"
  })
)

module.exports = environment