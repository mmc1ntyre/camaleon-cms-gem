require 'rails/generators/base'
require 'securerandom'
module CamaleonCms
  module Generators
    class InstallGenerator < Rails::Generators::Base
      source_root File.expand_path("../install_template", __FILE__)
      desc "This generator create all basic Camaleon CMS structure."

      def create_initializer_file
        apps_folder = Rails.root.join("app", "apps").to_s
        copy_file "../../../../config/system.json", "config/system.json"
        copy_file "plugin_routes.rb", "lib/plugin_routes.rb"
        directory("apps", apps_folder)
        append_to_file 'Gemfile' do
          "\n\n#################### Camaleon CMS include all gems for plugins and themes #################### \nrequire './lib/plugin_routes' \ninstance_eval(PluginRoutes.draw_gems)"
        end
      end
    end
  end
end