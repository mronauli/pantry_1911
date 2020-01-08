class Recipe
  attr_reader :name, :ingredients_required
  def initialize(name)
    @name = name
    @ingredients_required = {}
  end

  def add_ingredient(ingredient, amount)
    @ingredients_required[ingredient] = amount
  end

  def amount_required(ingredient)
    amount = 0
    @ingredients_required.each do |ing|
    if ing[0].name == ingredient.name
      amount = ing[1]
      end
    end
    amount
  end

  def ingredients
    ingredients = []
    @ingredients_required.each do |ingredient|
      ingredients << ingredient[0]
    end
    ingredients.flatten
  end

  def total_calories
    total = 0
    @ingredients_required.each do |ingredient|
      total += ingredient[0].calories * ingredient[1]
    end
    total
  end
end
