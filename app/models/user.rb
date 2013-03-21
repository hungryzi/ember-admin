class User < ActiveRecord::Base
  attr_accessible :age, :dob, :email, :gender, :name
end
