class CreateSecureEmails < ActiveRecord::Migration
  def change
    create_table :secure_emails do |t|
      t.string :to
      t.string :bcc
      t.string :subject
      t.text :body

      t.timestamps
    end
  end
end
