class Removetitlefromarticle < ActiveRecord::Migration
  def change
    remove_column :articles, :title
  end
end
