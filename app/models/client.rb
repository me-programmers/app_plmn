class Client < ActiveRecord::Base
  attr_accessible :address, :name, :source
end
