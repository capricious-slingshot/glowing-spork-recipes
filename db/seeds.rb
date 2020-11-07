Course.create(name: "Alcoholic Drinks")
Course.create(name: "Non-Alcoholic Drinks")
Course.create(name: "Salads")
Course.create(name: "Appetisers")
Course.create(name: "Main")
Course.create(name: "Dessert")
Course.create(name: "Snacks")


brownies = Recipe.create(
  photo: 'brownies.jpg',
  title: 'brownies',
  author_id: 1,
  description: "My perfect brownie is thick, fudgy, chewy, and chocolaty with a slight hint of gooey goodness. It also has that tissue-thin crinkly crust on top and just melts in your mouth.",
  course_id: 6,
  public: true
)
Ingredient.create(name: 'Sugar')
Ingredient.create(name: 'Egg')
Ingredient.create(name: 'Butter')
Ingredient.create(name: 'Flour')
Ingredient.create(name: 'Milk Chocolate')

brownies.measurements.create(recipe_id: 1, quantity: "5", unit: "Tablespoons", ingredient_id: 1)
brownies.measurements.create(recipe_id: 1, quantity: "3", unit: "Cups", ingredient_id: 2)
brownies.measurements.create(recipe_id: 1, quantity: "5", unit: "1/2 stick", ingredient_id: 3)
brownies.measurements.create(recipe_id: 1, quantity: "7", unit: "pinch", ingredient_id: 4)
brownies.measurements.create(recipe_id: 1, quantity: "6", unit: "teaspoons", ingredient_id: 5)

pizza = Recipe.create(
  photo: 'pizza.jpg',
  title: 'Margaharita Pizza',
  author_id: 2,
  description: "MCurabitur volutpat massa eu molestie tristique. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc consectetur eros ut lacus dapibus tincidunt. Sed semper hendrerit felis vitae pulvinar. Duis hendrerit ex sed eros sagittis feugiat. Aliquam erat volutpat. Ut euismod in sem in sollicitudin. Vestibulum ipsum ex, pretium at sem ac, interdum hendrerit felis. Sed ac diam ullamcorper, gravida nulla eu, dapibus nisi. Mauris ac feugiat nisl. Curabitur non eros eu tellus maximus vehicula non nec turpis. In hac habitasse platea dictumst. Duis sit amet quam et nulla congue feugiat.",
  course_id: 4,
  public: true
)

Ingredient.create(name: 'Flour')
Ingredient.create(name: 'Egg')
Ingredient.create(name: 'Cheese')
Ingredient.create(name: 'Tomato Sauce')
Ingredient.create(name: 'Basil')

pizza.measurements.create(recipe_id: 2, quantity: "5", unit: "Tablespoons", ingredient_id: 6)
pizza.measurements.create(recipe_id: 2, quantity: "3", unit: "Cups", ingredient_id: 7)
pizza.measurements.create(recipe_id: 2, quantity: "5", unit: "1/2 stick", ingredient_id: 8)
pizza.measurements.create(recipe_id: 2, quantity: "7", unit: "pinch", ingredient_id: 9)
pizza.measurements.create(recipe_id: 2, quantity: "6", unit: "2", ingredient_id: 10)

pad_thai = Recipe.create(
  photo: 'pad-thai.jpg',
  title: 'Pad Thai',
  author_id: 3,
  description: "Mauris ut arcu ut sem porttitor maximus. Duis et lacus et ante pretium faucibus sit amet id lacus. Nulla quis nisi nec tortor hendrerit interdum nec nec velit. Curabitur fermentum dolor eget lectus volutpat, a faucibus risus mattis.",
  course_id: 5,
  public: true
)
Ingredient.create(name: 'Rice noodles')
Ingredient.create(name: 'Egg')
Ingredient.create(name: 'Tamarind')
Ingredient.create(name: 'Bean Sprouts')
Ingredient.create(name: 'Soy Sauce')

pad_thai.measurements.create(recipe_id: 2, quantity: "5", unit: "Tablespoons", ingredient_id: 11)
pad_thai.measurements.create(recipe_id: 2, quantity: "3", unit: "Cups", ingredient_id: 12)
pad_thai.measurements.create(recipe_id: 2, quantity: "5", unit: "1/2 stick", ingredient_id: 13)
pad_thai.measurements.create(recipe_id: 2, quantity: "7", unit: "pinch", ingredient_id: 14)
pad_thai.measurements.create(recipe_id: 2, quantity: "6", unit: "2", ingredient_id: 15)

butter_chicken = Recipe.create(
  photo: 'butter-chicken.jpg',
  title: 'Butter Chicken',
  author_id: 4,
  description: "Curabitur fermentum dolor eget lectus volutpat, a faucibus risus mattis.",
  course_id: 5,
  public: true
)
Ingredient.create(name: 'Basmati Rice')
Ingredient.create(name: 'Coconut Milk')
Ingredient.create(name: 'Curry')
Ingredient.create(name: 'Chicken')
Ingredient.create(name: 'Salt')

butter_chicken.measurements.create(recipe_id: 2, quantity: "5", unit: "Tablespoons", ingredient_id: 16)
butter_chicken.measurements.create(recipe_id: 2, quantity: "3", unit: "Cups", ingredient_id: 17)
butter_chicken.measurements.create(recipe_id: 2, quantity: "5", unit: "1/2 stick", ingredient_id: 18)
butter_chicken.measurements.create(recipe_id: 2, quantity: "7", unit: "pinch", ingredient_id: 19)
butter_chicken.measurements.create(recipe_id: 2, quantity: "6", unit: "2", ingredient_id: 20)

ramen = Recipe.create(
  photo: 'ramen.jpg',
  title: 'Ramen',
  author_id: 5,
  description: "Easy homemade chicken ramen, with a flavorful broth, roasted chicken, fresh veggies, lots of noodles, and a soft cooked egg. Inspired by traditional Japanese ramen, but on the table in under an hour.",
  course_id: 5,
  public: true
)
Ingredient.create(name: 'Soft Boiled Egg')
Ingredient.create(name: 'Ramen Noodles')
Ingredient.create(name: 'Scallions')
Ingredient.create(name: 'Bone Broth')
Ingredient.create(name: 'Garlic')

ramen.measurements.create(recipe_id: 2, quantity: "5", unit: "Tablespoons", ingredient_id: 21)
ramen.measurements.create(recipe_id: 2, quantity: "3", unit: "Cups", ingredient_id: 22)
ramen.measurements.create(recipe_id: 2, quantity: "5", unit: "1/2 stick", ingredient_id: 23)
ramen.measurements.create(recipe_id: 2, quantity: "7", unit: "pinch", ingredient_id: 24)
ramen.measurements.create(recipe_id: 2, quantity: "6", unit: "2", ingredient_id: 25)

sushi_rice = Recipe.create(
  photo: 'sushi-rice.jpg',
  title: 'Sushi Rice',
  author_id: 1,
  description: "Here is my recipe for the perfect sushi rice. You can eat this alone or roll into your favorite sushi roll with ingredients of choice. I use strips of carrots, cucumbers and slices of avocado. You can adjust the amount of vinegar in this recipe to suit your taste.",
  course_id: 4,
  public: true
)
Ingredient.create(name: 'Sushi Rice')
Ingredient.create(name: 'Coconut oil')
Ingredient.create(name: 'Salt')
Ingredient.create(name: 'Bone Broth')
Ingredient.create(name: 'Water')

sushi_rice.measurements.create(recipe_id: 2, quantity: "5", unit: "Tablespoons", ingredient_id: 26)
sushi_rice.measurements.create(recipe_id: 2, quantity: "3", unit: "Cups", ingredient_id: 27)
sushi_rice.measurements.create(recipe_id: 2, quantity: "5", unit: "1/2 stick", ingredient_id: 28)
sushi_rice.measurements.create(recipe_id: 2, quantity: "7", unit: "pinch", ingredient_id: 29)
sushi_rice.measurements.create(recipe_id: 2, quantity: "6", unit: "2", ingredient_id: 30)

fish_tacos = Recipe.create(
  photo: 'fish-tacos.jpg',
  title: 'Fish Tacos',
  author_id: 2,
  description: "Love fish tacos? Well, these are the end-all be-all. Read on to see what makes these tacos so special.",
  course_id: 5,
  public: true
)
Ingredient.create(name: 'Mahi Mahi')
Ingredient.create(name: 'Lime')
Ingredient.create(name: 'Tortillas')
Ingredient.create(name: 'Cilantro')
Ingredient.create(name: 'Pickled Radish')

sushi_rice.measurements.create(recipe_id: 2, quantity: "5", unit: "Tablespoons", ingredient_id: 31)
sushi_rice.measurements.create(recipe_id: 2, quantity: "3", unit: "Cups", ingredient_id: 32)
sushi_rice.measurements.create(recipe_id: 2, quantity: "5", unit: "1/2 stick", ingredient_id: 33)
sushi_rice.measurements.create(recipe_id: 2, quantity: "7", unit: "pinch", ingredient_id: 34)
sushi_rice.measurements.create(recipe_id: 2, quantity: "6", unit: "2", ingredient_id: 35)

spring_rolls = Recipe.create(
  photo: 'spring-rolls.jpg',
  title: 'Fresh Spring Rolls',
  author_id: 4,
  description: "These spring rolls are a refreshing change from the usual fried variety, and have become a family favorite. They are great as a cool summertime appetizer, and are delicious dipped in one or both of the sauces.",
  course_id: 4,
  public: true
)
Ingredient.create(name: 'Rice Paper')
Ingredient.create(name: 'Lettuce')
Ingredient.create(name: 'Virmicelli Noodles')
Ingredient.create(name: 'Shrimp')
Ingredient.create(name: 'Hoisin Sauce')

spring_rolls.measurements.create(recipe_id: 2, quantity: "5", unit: "Tablespoons", ingredient_id: 36)
spring_rolls.measurements.create(recipe_id: 2, quantity: "3", unit: "Cups", ingredient_id: 37)
spring_rolls.measurements.create(recipe_id: 2, quantity: "5", unit: "1/2 stick", ingredient_id: 38)
spring_rolls.measurements.create(recipe_id: 2, quantity: "7", unit: "pinch", ingredient_id: 39)
spring_rolls.measurements.create(recipe_id: 2, quantity: "6", unit: "2", ingredient_id: 40)

bimbap = Recipe.create(
  photo: 'bimbap.jpg',
  title: 'Bimbap',
  author_id: 1,
  description: "Bibimbap (비빔밥) is probably one of the most well-known and beloved Korean dishes to many people. Even if people don’t know anything about Korea, it’s not too difficult to find people who had Bibimbap sometime in their lives.",
  course_id: 5,
  public: true,

)
Ingredient.create(name: 'White Rice')
Ingredient.create(name: 'Kimchi')
Ingredient.create(name: 'Bulgogi')
Ingredient.create(name: 'Scallions')
Ingredient.create(name: 'Sesame Seeds')
Ingredient.create(name: 'Over Easy Egg')

bimbap.measurements.create(recipe_id: 2, quantity: "5", unit: "Tablespoons", ingredient_id: 41)
bimbap.measurements.create(recipe_id: 2, quantity: "3", unit: "Cups", ingredient_id: 42)
bimbap.measurements.create(recipe_id: 2, quantity: "5", unit: "1/2 stick", ingredient_id: 43)
bimbap.measurements.create(recipe_id: 2, quantity: "7", unit: "pinch", ingredient_id: 44)
bimbap.measurements.create(recipe_id: 2, quantity: "6", unit: "2", ingredient_id: 45)
bimbap.measurements.create(recipe_id: 2, quantity: "6", unit: "2", ingredient_id: 46)

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

User.create(name: 'test1', email: 'test1@me.com', password: '123456789', password_confirmation: '123456789')
User.create(name: 'test2', email: 'test2@me.com', password: '123456789', password_confirmation: '123456789', public_profile: false)
User.create(name: 'test3', email: 'test3@me.com', password: '123456789', password_confirmation: '123456789')
User.create(name: 'test4', email: 'test4@me.com', password: '123456789', password_confirmation: '123456789')
User.create(name: 'test5', email: 'test5@me.com', password: '123456789', password_confirmation: '123456789')
User.create(name: 'test6', email: 'test6@me.com', password: '123456789', password_confirmation: '123456789', admin: true)

Step.create(description:"kjsad kljskd lhak mkjkjlsadgv iub oaisd buebrvilb aihc alnksvnjvpak oah iabskja a kskb kjasb kjabsvkb akbkj", recipe_id: 1)
Step.create(description:"kjd kskd sadgv iub buebr vilb aihc alnks vnjvp ak oah iabskja a kskb kj", recipe_id: 1)
Step.create(description:"jskd lhak mkj lsa oaise brv ilnjvp ak oah iabskja a kskb kjasb kjabsvkb akbkj", recipe_id: 1)
Step.create(description:"kd lhak mkjk jls adgv iub oaisd bueb rvi lb aihc alnk svnjvpak oah iab skja a kskbkjasb akbkj", recipe_id: 1)
Step.create(description:"skdk jkj  sad gb oaisd brvilb hc alnk s vnjvpak oah ia bskja a", recipe_id: 1)

UserRecipe.create(user_id: 1, recipe_id: 1, rating: 3, saved: false, notes: "inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet")
UserRecipe.create(user_id: 2, recipe_id: 1, rating: 4, saved: true, notes: "inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet")
UserRecipe.create(user_id: 3, recipe_id: 1, rating: 3, saved: false, notes: "quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia aut fugit, sed quia consequuntur sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet")
UserRecipe.create(user_id: 4, recipe_id: 1, rating: 1, saved: false, notes: "vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit sequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet")
UserRecipe.create(user_id: 5, recipe_id: 1, rating: 3, saved: false, notes: "ptio cumque nihil impedit quo minus id quod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus, ut aut reiciendis voluptatibus maiores alias consequatur aut perferendis doloribus asperiores repellat.")
UserRecipe.create(user_id: 6, recipe_id: 1, rating: 4, saved: true, notes: "et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. ")
UserRecipe.create(user_id: 7, recipe_id: 1, rating: 3, saved: false, notes: "ncidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur")
UserRecipe.create(user_id: 8, recipe_id: 1, rating: 5, saved: true, notes: "quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum")
UserRecipe.create(user_id: 9, recipe_id: 1, rating: 5, saved: true, notes: "incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? ")