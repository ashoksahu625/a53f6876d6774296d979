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
  	data = User.find_by(firstName: params[:input]) || User.find_by(lastName: params[:input]) || User.find_by(email: params[:input])
  end

end

