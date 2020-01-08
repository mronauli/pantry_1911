class Pantry
  attr_reader :stock
  def initialize
    @stock = {}
  end

  def stock_check(ingredient)
    @stock[ingredient]
  end

  def restock(ingredient, amount)
    if !@stock[ingredient] = amount
      @stock[ingredient] = amount
    else
      @stock[ingredient] += amount
    end
  end

  def enough_ingredients_for?(recipe)
    if @stock.ingredient.amount == recipe.ingredients_required.amount
      true
    else
      false
    end
  end
end
