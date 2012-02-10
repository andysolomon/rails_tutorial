class User
  attr_accessor :name, :email

  def initilize attributes = {}
    @name = attributes[:name]
    @email = attributes[:email]
  end
  def formatted_email
    "#{@name} <#{@email}>"
  end
end
