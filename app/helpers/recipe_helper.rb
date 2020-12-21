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
    link_to "Edit Recipe", edit_recipe_path(recipe), class: "button is-warning is-large crud-button" if recipe.author?(current_user)
	end

	def star_average_text(recipe)
		rating = recipe.star_average.round(1)
		!rating.zero? ? "#{rating.to_s} Stars" : "Not enough ratings yet"
	end

	def convert_index(index)
    index += 1
	end

	def	shuffled_links(categories,restrictions,tags)
		links = []
		categories.each do |category|
		  links << (link_to "#{category.name}", "#", class:"subtitle is-2 shuffled tag")
		end
		restrictions.each do |restriction|
			links << (link_to "#{restriction.name}", "#", class:"subtitle is-3 shuffled tag is-white")
		end
		tags.each do |tag|
			links << (link_to "##{tag.name}", "#", class:"subtitle is-4 shuffled")
		end
		links.shuffle
	end

	def	authorized(user)
		@current_user == @user || @current_user.admin?
	end

	def	user_save_button(recipe, user)
		if recipe.saved?(user)
			link_to "Saved to Your Recipes", user_recipes_path(user)
		else
			link_to "Save Recipe", root_path, class: "button is-warning is-large crud-button"
		end
	end

	def user_notes(user_id, recipe_id)
		record = UserRecipe.record(user_id, recipe_id)
		record ? record.notes : "You havent added any notes yet."
	end
end