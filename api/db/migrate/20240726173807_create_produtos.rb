class CreateProdutos < ActiveRecord::Migration[7.1]
  def change
    create_table :produtos do |t|
      t.string :nome
      t.string :slug
      t.string :descricao
      t.float :preco
      t.string :status, default: 'ativo'
      t.references :categoria, null: false, foreign_key: true      

      t.timestamps
    end
  end
end
