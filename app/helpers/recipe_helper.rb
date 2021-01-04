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
		rating.zero? ? "Not enough ratings yet" : "#{rating.to_s} Stars"
	end

	def convert_index(index)
    index += 1
	end

	def	shuffled_links(categories,restrictions,tags)
		links = []
		categories.each do |category|
		  links << (link_to "#{category.name}", recipe_category_path(category.name), class:"subtitle is-2 shuffled tag")
		end
		restrictions.each do |restriction|
			links << (link_to "#{restriction.name}", "/recipes?utf8=✓&query=#{restriction.name}&commit=Search", class:"subtitle is-3 shuffled tag is-white")
		end
		tags.each do |tag|
			links << (link_to "##{tag.name}", "#", class:"subtitle is-4 shuffled")
		end
		links.shuffle
	end

	def	authorized(user)
		if current_user
			current_user == user || current_user.admin 
		end
	end

	def	user_save_button(recipe, user)
		if recipe.saved?(user)
			link_to "Saved Recipes", user_recipes_path(user), class: "button is-success is-large" 
		else
			button_to "Save Recipe", save_recipe_path(user.id, recipe.id), class: "button is-info is-large"
		end
	end

	def user_notes(user_id, recipe_id)
		record = UserRecipeCard.record(user_id, recipe_id)
		record.present? && record.notes.present? ? record.notes : "You havent added any notes yet."
	end

	def user_stars(user_id, recipe_id)
		record =  UserRecipeCard.record(user_id, recipe_id)
		record.present? && record.rating.present? ? record.rating : 0
	end

	def	user_notes_button(user_id, recipe_id)
		card = UserRecipeCard.find_by(user_id: user_id, recipe_id: recipe_id)
		if card.present?
			link_to "Edit Notes", edit_user_recipe_card_path(current_user.id, @recipe.id, card.id), class: "button is-warning is-large"
		else
			link_to "Add Notes", new_user_recipe_card_path(current_user.id, @recipe.id), class: "button is-warning is-large"
		end
	end

	def	save_button_or_save_count(recipe, user)
		if !recipe.author?(user) 
			user_save_button(recipe, user)
		else
			tag.h5 "Your recipe has been saved #{pluralize(recipe.number_of_saves, "time")}", class: "subtitle is-5"
		end
			
	end
end