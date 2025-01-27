class CreateCategorias < ActiveRecord::Migration[7.1]
  def change
    create_table :categorias do |t|
      t.string :nome, index: { unique: true }
      t.string :slug

      t.timestamps
    end
  end
end
