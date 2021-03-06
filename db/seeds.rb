# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


#Ingredient.create(name: "lemon")
#Ingredient.create(name: "ice")
#Ingredient.create(name: "mint leaves")


Cocktail.destroy_all

require 'open-uri'
require 'json'

url = "https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list"

parsed_ingredients = JSON.parse(open(url).read)
ingredient_pairs = parsed_ingredients["drinks"]

Ingredient.delete_all

ingredient_pairs.each do |ing|
 @ing = Ingredient.new(name: ing["strIngredient1"])
 @ing.save
end


mojito = Cocktail.new(name: "mojito")
mojito.save!
white = Cocktail.new(name: "white russian")
white.save!
negroni = Cocktail.new(name: "negroni")
negroni.save!
spritz = Cocktail.new(name: "spritz")
spritz.save!
ginfizz = Cocktail.new(name: "ginfizz")
ginfizz.save!
