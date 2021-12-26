const { environment } = require('@rails/webpacker')

const { VueLoaderPlugin } = require('vue-loader')
environment.plugins.prepend(
    'VueLoaderPlugin',
    new VueLoaderPlugin()
)

environment.loaders.prepend('vue', {
    test: /\.vue$/,
    use: [{
        loader: 'vue-loader'
    }]
})

const webpack = require('webpack')
environment.plugins.append(
    'Provide',
    new webpack.ProvidePlugin({
        $: 'jquery',
        jQuery: 'jquery',
        Popper: ['popper.js', 'default']
    })
)

// .use配列の最後を {loader: 'resolve-url'}に置き換えている
environment.loaders.get('sass').use.splice(-1, 0, {
    loader: 'resolve-url-loader'
})

module.exports = environment
