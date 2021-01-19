class EnablePostgressPlugins < ActiveRecord::Migration[6.1]
  def change
    execute <<-SQL
      CREATE EXTENSION cube;
      CREATE EXTENSION earthdistance;
    SQL
  end
end
