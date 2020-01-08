require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'

class IngredientTest < Minitest::Test
  def test_ingredient_exists
     ingredient = Ingredient.new("Cheese", "oz", 50)
     assert_instance_of Ingredient, ingredient
  end

  def test_ingredient_has_a_name
    ingredient = Ingredient.new("Cheese", "oz", 50)
    assert_equal "Cheese", ingredient.name
  end

  def test_ingredient_has_a_unit
    ingredient = Ingredient.new("Cheese", "oz", 50)
    assert_equal "oz", ingredient.unit
  end

  def test_ingredient_has_calories
    ingredient = Ingredient.new("Cheese", "oz", 50)
    assert_equal 50, ingredient.calories
  end
end
