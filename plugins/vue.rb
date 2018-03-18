run_with_clean_bundler_env "yarn add bootstrap@4.0.0-alpha.6 \
                                     jquery \
                                     jquery-ujs \
                                     tether \
                                     vue-resource \
                                     vue-router"

copy_file "Procfile.dev", "Procfile.dev"
copy_file "buildpacks", ".buildpacks"

FileUtils.rm_f("app/javascript/packs/hello_vue.js")
FileUtils.rm_f("app/javascript//app.vue")


insert_into_file "config/webpack/environment.js", after: /const { environment }.*\n/ do
<<-'RUBY'
const webpack = require('webpack')
environment.plugins.append('Provide', new webpack.ProvidePlugin({
  $: 'jquery',
  jQuery: 'jquery',
  Popper: ['popper.js', 'default'],
  Tether: 'tether'
}))
RUBY
end



directory "app/js", "app/javascript", force: true
copy_file "app/views/layouts/application.html.erb", force: true
copy_file "app/views/ui/index.html.erb"
copy_file "app/controllers/ui_controller.rb"

route "root to: 'ui#index'"
route "get '/*path', to: 'ui#index'"