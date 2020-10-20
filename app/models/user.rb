class User
  include Mongoid::Document
  include Mongoid::Timestamps
  field :_id, type: String
  field :firstName, type: String
  field :lastName, type: String
  field :email, type: String

  def self.find_all
  	data = []
  	User.each do |u|
  	  data << u
    end		
  end

  def find_data(params)
    data = []
  	data = User.where(firstName: params[:firstName]).or(User.where(lastName: params[:firstName]))
  end

end

