class CreateSpeakers < ActiveRecord::Migration
  def change
    create_table :speakers do |t|
      t.string :name
      t.string :gmail
      t.string :fb_link
      t.string :phone
      t.string :location
      t.string :ioh_url
      t.string :feedback
      t.string :speaker_school
      t.string :speaker_department

      t.timestamps null: false
    end
  end
end
