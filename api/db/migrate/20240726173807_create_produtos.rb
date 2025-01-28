class CreateProdutos < ActiveRecord::Migration[7.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :slug
      t.string :descricao
      t.float :preco
      t.integer :status, default: 1, null: false
      t.references :categoria, null: false, foreign_key: true

      t.timestamps
    end
  end
end
