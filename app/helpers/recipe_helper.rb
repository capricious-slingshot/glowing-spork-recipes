module RecipeHelper
	def	recipe_image(recipe)
		recipe.photo.present? ? recipe.photo : "spork.png"
	end

	def	author_name(recipe)
	  author(recipe).present? ? author(recipe).name : "Anonymous"
	end

	def	author(recipe)
		User.find(recipe.author_id)
	end
		
	def	created_on(recipe)
    recipe.created_at.strftime("%B %d, %Y")
	end

	def datetime_machine(recipe)
		recipe.created_at.strftime("%Y-%m-%d")
	end

	def	short_description(recipe)
    recipe.description.truncate(40)
	end

	def	author_edit_button(recipe)
		if current_user.id == recipe.author_id
      link_to "Edit Recipe", edit_recipe_path(recipe), class: "button is-warning is-large crud-button"
		end
	end

	def star_rating_text(recipe)
		rating = recipe.star_rating.round(1)
		!rating.zero? ? "#{rating.to_s} Stars" : "Not enough ratings yet"
	end
end