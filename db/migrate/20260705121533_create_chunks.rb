class CreateChunks < ActiveRecord::Migration[8.0]
  def change
    create_table :chunks do |t|
      t.references :document, null: false, foreign_key: true
      t.text :content
      t.vector :embedding, limit: 1024  #voyage-3.5 outputs 1024-dim vectors

      t.timestamps
    end
    add_index :chunks, :embedding, using: :hnsw, opclass: :vector_cosine_ops
  end
end
