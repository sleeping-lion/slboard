# encoding: utf-8

class CreateDeviseToUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :group, :null=>false      
      ## Database authenticatable
      t.string :email,  :null => false
      t.string :name, :null => false, :limit=>60      
      t.string :encrypted_password, :null => false
      t.string :description      
      t.string :alternate_name, :limit=>60
      t.boolean :gender, :default=>true      
      t.date :birth_date
      t.date :death_date
      t.string :url
      t.string :job_title, :limit=>60

      
      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, :default => 0
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.string   :current_sign_in_ip
      t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0 # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at
      
      t.integer :user_photos_count,:default=>0,:null=>false      

      ## Token authenticatable
      # t.string :authentication_token
      t.boolean :admin, :null=>false, :default => false
      t.boolean :intro, :null=>false, :default=>false
      t.boolean :enable, :null=>false, :default=>true
      t.timestamps :null=>false
      # Uncomment below if timestamps were not included in your original model.
      # t.timestamps
    end
    
    add_index :users, :group_id
    add_index :users, :email,                :unique => true
    add_index :users, :reset_password_token, :unique => true
    # add_index :users, :confirmation_token,   :unique => true
    # add_index :users, :unlock_token,         :unique => true
    # add_index :users, :authentication_token, :unique => true        
  end
end
