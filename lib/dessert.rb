class Dessert
  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  
  attr_accessor :name
  attr_accessor :calories
  
  def healthy?
    if calories < 200
      return true
    end
  end
  def delicious?
    return true
  end

end

class JellyBean < Dessert
  
  def initialize(flavor)
    @flavor = flavor
    self.calories = 5
    self.name = flavor + " jelly bean"
  end
  
  # I happen to enjoy licorice, so I changed the rejected flavor to popcorn
  def delicious?
    if @flavor == "popcorn"
      return false
    end
    return true
  end
end