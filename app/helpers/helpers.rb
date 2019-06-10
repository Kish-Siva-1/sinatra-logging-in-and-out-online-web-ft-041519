class Helpers < ActiveRecord::Base
  
  def self.current_user(args)
    user = User.find(args[:user_id])
  end 
   
  def self.is_logged_in?(args)
    !!args[:user_id]
  end 
  
end