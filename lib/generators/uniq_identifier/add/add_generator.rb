require 'pry'
require 'rails/generators/active_record'

module UniqIdentifier
  module Generators
    class AddGenerator < Rails::Generators::NamedBase
      include Rails::Generators::Migration

      source_root File.expand_path('../templates', __FILE__)

      def self.next_migration_number(path)
        ActiveRecord::Generators::Base.next_migration_number(path)
      end

      # :migration_file_name, :migration_class_name

      desc <<DESC
description :
    add migration file to choosen model
    rails generate uniq_identifier:add <model>
DESC
      def add_migration_file
        # binding.pry
        # template 'uniq_identifier.rb', "config/initializers/uniq_identifier.rb"
        migration_template 'migration.rb', "db/migrate/add_uuid_user.rb"
        # migration_template "migration.rb", "db/migrate/add_foo_to_bar.rb"
      #         hook   = 'uniq_identifier'
      # data   = "\n"
      # data += indent("#{hook}")
      # header = "class #{class_name} < ActiveRecord::Base"
      # model_path = File.join('app', 'models', "#{file_path}.rb")
      # binding.pry
      # inject_into_file model_path, data, after: /header/, verbose: true

      end
    end

  end
end
