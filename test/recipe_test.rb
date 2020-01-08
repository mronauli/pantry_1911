require 'minitest/autorun'
require 'minitest/pride'
require './lib/ingredient'
require './lib/recipe'

class RecipeTest < Minitest::Test
  def test_recipe_exists
    recipe = Recipe.new("Mac and Cheese")
    assert_instance_of Recipe, recipe
  end

  def test_recipe_has_a_name
    recipe = Recipe.new("Mac and Cheese")
    assert_equal "Mac and Cheese", recipe.name
  end

  def test_ingredients_required_for_a_recipe_starts_off_as_empty_hash
    recipe = Recipe.new("Mac and Cheese")
    assert_equal ({}), recipe.ingredients_required
  end

  def test_can_add_ingredients_required_for_a_recipe
    recipe = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new("Cheese", "C", 100)
    ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)
    assert_equal ({ingredient1 => 2, ingredient2 => 8}), recipe.ingredients_required
  end

  def test_can_get_amount_requireed_in_a_recipe
    recipe = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new("Cheese", "C", 100)
    ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)
    assert_equal 2, recipe.amount_required(ingredient1)
    assert_equal 8, recipe.amount_required(ingredient2)
  end

  def test_can_get_list_of_ingredients_in_a_recipe
    recipe = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new("Cheese", "C", 100)
    ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)
    assert_equal [ingredient1, ingredient2], recipe.ingredients
  end

  def test_can_get_a_recipes_total_calories
    recipe = Recipe.new("Mac and Cheese")
    ingredient1 = Ingredient.new("Cheese", "C", 100)
    ingredient2 = Ingredient.new("Macaroni", "oz", 30)
    recipe.add_ingredient(ingredient1, 2)
    recipe.add_ingredient(ingredient2, 8)
    assert_equal 440, recipe.total_calories
  end
end
