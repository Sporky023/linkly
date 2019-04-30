class CreateShortenings < ActiveRecord::Migration[5.2]
  def change
    create_table :shortenings do |t|
      t.string :long_url
      t.string :short_link_code

      t.timestamps
    end
  end
end
