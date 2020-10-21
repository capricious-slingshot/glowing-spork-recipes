Course.create(name: "Alcoholic Drinks")
Course.create(name: "Non-Alcoholic Drinks")
Course.create(name: "Salads")
Course.create(name: "Appetisers")
Course.create(name: "Main")
Course.create(name: "Dessert")
Course.create(name: "Snacks")

Recipe.create(
  photo: 'brownies.jpg',
  title: 'brownies',
  author_id: 1,
  description: "My perfect brownie is thick, fudgy, chewy, and chocolaty with a slight hint of gooey goodness. It also has that tissue-thin crinkly crust on top and just melts in your mouth.",
  course_id: 6,
  public: true
)

Recipe.create(
  photo: 'pizza.jpg',
  title: 'Margaharita Pizza',
  author_id: 2,
  description: "MCurabitur volutpat massa eu molestie tristique. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc consectetur eros ut lacus dapibus tincidunt. Sed semper hendrerit felis vitae pulvinar. Duis hendrerit ex sed eros sagittis feugiat. Aliquam erat volutpat. Ut euismod in sem in sollicitudin. Vestibulum ipsum ex, pretium at sem ac, interdum hendrerit felis. Sed ac diam ullamcorper, gravida nulla eu, dapibus nisi. Mauris ac feugiat nisl. Curabitur non eros eu tellus maximus vehicula non nec turpis. In hac habitasse platea dictumst. Duis sit amet quam et nulla congue feugiat.",
  course_id: 4,
  public: true
)

Recipe.create(
  photo: 'pad-thai.jpg',
  title: 'Pad Thai',
  author_id: 3,
  description: "Mauris ut arcu ut sem porttitor maximus. Duis et lacus et ante pretium faucibus sit amet id lacus. Nulla quis nisi nec tortor hendrerit interdum nec nec velit. Curabitur fermentum dolor eget lectus volutpat, a faucibus risus mattis.",
  course_id: 5,
  public: true
)

Recipe.create(
  photo: 'butter-chicken.jpg',
  title: 'Butter Chicken',
  author_id: 4,
  description: "Curabitur fermentum dolor eget lectus volutpat, a faucibus risus mattis.",
  course_id: 5,
  public: true
)

Recipe.create(
  photo: 'ramen.jpg',
  title: 'Ramen',
  author_id: 5,
  description: "Easy homemade chicken ramen, with a flavorful broth, roasted chicken, fresh veggies, lots of noodles, and a soft cooked egg. Inspired by traditional Japanese ramen, but on the table in under an hour.",
  course_id: 5,
  public: true
)

Recipe.create(
  photo: 'sushi-rice.jpg',
  title: 'Sushi Rice',
  author_id: 1,
  description: "Here is my recipe for the perfect sushi rice. You can eat this alone or roll into your favorite sushi roll with ingredients of choice. I use strips of carrots, cucumbers and slices of avocado. You can adjust the amount of vinegar in this recipe to suit your taste.",
  course_id: 4,
  public: true
)

Recipe.create(
  photo: 'fish-tacos.jpg',
  title: 'Fish Tacos',
  author_id: 2,
  description: "Love fish tacos? Well, these are the end-all be-all. Read on to see what makes these tacos so special.",
  course_id: 5,
  public: true
)

Recipe.create(
  photo: 'spring-rolls.jpg',
  title: 'Fresh Spring Rolls',
  author_id: 4,
  description: "These spring rolls are a refreshing change from the usual fried variety, and have become a family favorite. They are great as a cool summertime appetizer, and are delicious dipped in one or both of the sauces.",
  course_id: 4,
  public: true
)

Recipe.create(
  photo: 'bimbap.jpg',
  title: 'Bimbap',
  author_id: 1,
  description: "Bibimbap (비빔밥) is probably one of the most well-known and beloved Korean dishes to many people. Even if people don’t know anything about Korea, it’s not too difficult to find people who had Bibimbap sometime in their lives.",
  course_id: 5,
  public: true
)

Category.create(name: "Vietnamese")
Category.create(name: "Thai")
Category.create(name: "Indian")
Category.create(name: "Mexican")
Category.create(name: "British")
Category.create(name: "French")
Category.create(name: "American")
Category.create(name: "Moroccan")
Category.create(name: "Ethiopian")
Category.create(name: "Japanese")
Category.create(name: "Italian")
Category.create(name: "Korean")
Category.create(name: "Mediterranean")
Category.create(name: "Spanish")
Category.create(name: "Chinese")
Category.create(name: "Middleastern")

Restriction.create(name: "Nut Free")
Restriction.create(name: "Dairy Free")
Restriction.create(name: "No Added Sugar")
Restriction.create(name: "Vegan")
Restriction.create(name: "Gluten Free")
Restriction.create(name: "Vegetarian")
Restriction.create(name: "Egg Free")
Restriction.create(name: "No Shellfish")

Tag.create(name: 'breakfast')
Tag.create(name: 'paleo')
Tag.create(name: 'lunch')
Tag.create(name: 'dinner')
Tag.create(name: 'sweet')
Tag.create(name: 'savory')

Ingredient.create(name: 'Sugar')
Ingredient.create(name: 'Egg')
Ingredient.create(name: 'Butter')
Ingredient.create(name: 'Flour')
Ingredient.create(name: 'Milk Chocolate')
Ingredient.create(name: 'Dark Chocolate')
Ingredient.create(name: 'Water')
Ingredient.create(name: 'Vanilla')
Ingredient.create(name: 'Heavy Cream')
Ingredient.create(name: 'Brown Sugar')
Ingredient.create(name: 'Yeast')

Measurement.create(recipe_id: 1, quantity_id: 5, unit_id: 8, ingredient_id: 3)
Measurement.create(recipe_id: 1, quantity_id: 3, unit_id: 3, ingredient_id: 5)
Measurement.create(recipe_id: 1, quantity_id: 5, unit_id: 1, ingredient_id: 7)
Measurement.create(recipe_id: 1, quantity_id: 7, unit_id: 6, ingredient_id: 2)
Measurement.create(recipe_id: 1, quantity_id: 6, unit_id: 5, ingredient_id: 1)

Quantity.create(ammount: "10")
Quantity.create(ammount: "9")
Quantity.create(ammount: "8")
Quantity.create(ammount: "7")
Quantity.create(ammount: "6")
Quantity.create(ammount: "5")
Quantity.create(ammount: "4")
Quantity.create(ammount: "3")
Quantity.create(ammount: "2")
Quantity.create(ammount: "1")
Quantity.create(ammount: "1/2")
Quantity.create(ammount: "1/3")
Quantity.create(ammount: "2/3")
Quantity.create(ammount: "1/4")
Quantity.create(ammount: "3/4")
Quantity.create(ammount: "1/8")
Quantity.create(ammount: "3/8") 
Quantity.create(ammount: "5/8")
Quantity.create(ammount: "7/8")

Unit.create(name: "lb.")
Unit.create(name: "gallon")
Unit.create(name: "quart")
Unit.create(name: "pint")
Unit.create(name: "cup")
Unit.create(name: "fluid ounce")
Unit.create(name: "tablespoon")
Unit.create(name: "teaspoon")
Unit.create(name: "pinch")
Unit.create(name: "sprinkle")

User.create(name: 'test1', email: 'test1@me.com', password: '123456789', password_confirmation: '123456789')
User.create(name: 'test2', email: 'test2@me.com', password: '123456789', password_confirmation: '123456789')
User.create(name: 'test3', email: 'test3@me.com', password: '123456789', password_confirmation: '123456789')
User.create(name: 'test4', email: 'test4@me.com', password: '123456789', password_confirmation: '123456789')
User.create(name: 'test5', email: 'test5@me.com', password: '123456789', password_confirmation: '123456789')
User.create(name: 'test6', email: 'test6@me.com', password: '123456789', password_confirmation: '123456789', admin: true)

Step.create(description:"kjsad kljskd lhak mkjkjlsadgv iub oaisd buebrvilb aihc alnksvnjvpak oah iabskja a kskb kjasb kjabsvkb akbkj", position: 1, recipe_id: 1)
Step.create(description:"kjd kskd sadgv iub buebr vilb aihc alnks vnjvp ak oah iabskja a kskb kj", position: 2, recipe_id: 1)
Step.create(description:"jskd lhak mkj lsa oaise brv ilnjvp ak oah iabskja a kskb kjasb kjabsvkb akbkj", position: 3, recipe_id: 1)
Step.create(description:"kd lhak mkjk jls adgv iub oaisd bueb rvi lb aihc alnk svnjvpak oah iab skja a kskbkjasb akbkj", position: 4, recipe_id: 1)
Step.create(description:"skdk jkj  sad gb oaisd brvilb hc alnk s vnjvpak oah ia bskja a", position: 5, recipe_id: 1)

UserRecipe.create(user_id: 1, recipe_id: 1, rating: 3, saved: false, notes: "inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet")
UserRecipe.create(user_id: 2, recipe_id: 1, rating: 4, saved: true, notes: "inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet")
UserRecipe.create(user_id: 3, recipe_id: 1, rating: 3, saved: false, notes: "quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia aut fugit, sed quia consequuntur sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet")
UserRecipe.create(user_id: 4, recipe_id: 1, rating: 1, saved: false, notes: "vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit sequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet")
UserRecipe.create(user_id: 5, recipe_id: 1, rating: 3, saved: false, notes: "ptio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.")
UserRecipe.create(user_id: 6, recipe_id: 1, rating: 4, saved: true, notes: "et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ")
UserRecipe.create(user_id: 7, recipe_id: 1, rating: 3, saved: false, notes: "ncidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur")
UserRecipe.create(user_id: 8, recipe_id: 1, rating: 5, saved: true, notes: "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
UserRecipe.create(user_id: 9, recipe_id: 1, rating: 5, saved: true, notes: "incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? ")

Style.create(name: "Vietnamese")
Style.create(name: "Thai")
Style.create(name: "Indian")
Style.create(name: "Mexican")
Style.create(name: "British")
Style.create(name: "French")
Style.create(name: "American")
Style.create(name: "Moroccan")
Style.create(name: "Ethiopian")
Style.create(name: "Japanese")
Style.create(name: "Italian")
Style.create(name: "Korean")
Style.create(name: "Mediterranean")
Style.create(name: "Spanish")
Style.create(name: "Chinese")
Style.create(name: "Middleastern")