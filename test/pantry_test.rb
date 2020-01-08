# ## Iteration 3
#
# Use TDD to build a `Pantry` class that responds to the following interaction pattern:
#
# ```ruby
# pry(main)> require './lib/pantry'
# # => true
#
# pry(main)> require './lib/ingredient'
# # => true
#
# pry(main)> require './lib/recipe'
# # => true
#
# pry(main)> pantry = Pantry.new
# # => #<Pantry:0x007fd8858863b8...>
#
# pry(main)> ingredient1 = Ingredient.new("Cheese", "C", 50)
# # => #<Ingredient:0x007fd885846e20...>
#
# pry(main)> ingredient2 = Ingredient.new("Macaroni", "oz", 200)
# # => #<Ingredient:0x007fd88582ed98...>
#
# pry(main)> recipe = Recipe.new("Mac and Cheese")
# # => #<Recipe:0x007fd885050fe0...>
#
# pry(main)> recipe.add_ingredient(ingredient1, 2)
#
# pry(main)> recipe.add_ingredient(ingredient2, 8)
#
# pry(main)> pantry.stock
# # => {}
#
# pry(main)> pantry.stock_check(ingredient1)
# # => 0
#
# pry(main)> pantry.restock(ingredient1, 5)
#
# pry(main)> pantry.restock(ingredient1, 10)
#
# pry(main)> pantry.stock_check(ingredient1)
# # => 15
#
# pry(main)> pantry.enough_ingredients_for?(recipe)
# # => false
#
# pry(main)> pantry.restock(ingredient2, 7)
#
# pry(main)> pantry.enough_ingredients_for?(recipe)
# # => false
#
# pry(main)> pantry.restock(ingredient2, 1)
#
# pry(main)> pantry.enough_ingredients_for?(recipe)
# # => true
# ```
require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'
require './lib/pantry'

class PantryTest < Minitest::Test
  def test_pantry_exists
    pantry = Pantry.new
    assert_instance_of Pantry, pantry
  end

  def test_pantry_stock_starts_as_empty_hash
    pantry = Pantry.new
    assert_equal ({}), pantry.stock
  end

  def test_can_check_stock_of_ingredient_in_pantry
    pantry = Pantry.new
    recipe = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new("Cheese", "C", 50)
    recipe.add_ingredient(ingredient1, 2)
    assert_equal 0, pantry.stock_check(ingredient1)
  end

  def test_can_restock_pantry_with_ingredients
    pantry = Pantry.new
    ingredient1 = Ingredient.new("Cheese", "C", 50)
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    assert_equal 15, pantry.stock_check(ingredient1)
  end

  def test_can_check_if_amount_of_ingredients_is_enough_for_recipe
    pantry = Pantry.new
    recipe = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new("Cheese", "C", 50)
    ingredient2 = Ingredient.new("Macaroni", "oz", 200)
    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)
    pantry.restock(ingredient1, 5)
    pantry.restock(ingredient1, 10)
    assert_equal false, pantry.enough_ingredients_for?(recipe)
    pantry.restock(ingredient2, 7)
    assert_equal false, pantry.enough_ingredients_for?(recipe)
    pantry.restock(ingredient2, 1)
    assert_equal true, pantry.enough_ingredients_for?(recipe)
  end
end
