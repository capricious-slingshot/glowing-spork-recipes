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
  author: nil, 
  description: "My perfect brownie is thick, fudgy, chewy, and chocolaty with a slight hint of gooey goodness. It also has that tissue-thin crinkly crust on top and just melts in your mouth.",
  rating: 5,
  course_id: 6
)

Recipe.create(
  photo: 'pizza.jpg',
  title: 'Margaharita Pizza',
  author: "Shannon L", 
  description: "MCurabitur volutpat massa eu molestie tristique. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nunc consectetur eros ut lacus dapibus tincidunt. Sed semper hendrerit felis vitae pulvinar. Duis hendrerit ex sed eros sagittis feugiat. Aliquam erat volutpat. Ut euismod in sem in sollicitudin. Vestibulum ipsum ex, pretium at sem ac, interdum hendrerit felis. Sed ac diam ullamcorper, gravida nulla eu, dapibus nisi. Mauris ac feugiat nisl. Curabitur non eros eu tellus maximus vehicula non nec turpis. In hac habitasse platea dictumst. Duis sit amet quam et nulla congue feugiat.",
  rating: 4,
  course_id: 4
)

Recipe.create(
  photo: 'pad-thai.jpg',
  title: 'Pad Thai',
  author: "Shelly L",  
  description: "Mauris ut arcu ut sem porttitor maximus. Duis et lacus et ante pretium faucibus sit amet id lacus. Nulla quis nisi nec tortor hendrerit interdum nec nec velit. Curabitur fermentum dolor eget lectus volutpat, a faucibus risus mattis.",
  rating: 3,
  course_id: 5
)

Recipe.create(
  photo: 'butter-chicken.jpg',
  title: 'Butter Chicken',
  author: "Sam K",
  description: "Curabitur fermentum dolor eget lectus volutpat, a faucibus risus mattis.",
  rating: 4,
  course_id: 5
)

Recipe.create(
  photo: 'ramen.jpg',
  title: 'Ramen',
  author: 'Lee M',  
  description: "Easy homemade chicken ramen, with a flavorful broth, roasted chicken, fresh veggies, lots of noodles, and a soft cooked egg. Inspired by traditional Japanese ramen, but on the table in under an hour.",
  rating: 5,
  course_id: 5
)

Recipe.create(
  photo: 'sushi-rice.jpg',
  title: 'Sushi Rice',
  author: 'Shen Z',
  description: "Here is my recipe for the perfect sushi rice. You can eat this alone or roll into your favorite sushi roll with ingredients of choice. I use strips of carrots, cucumbers and slices of avocado. You can adjust the amount of vinegar in this recipe to suit your taste.",
  rating: 4,
  course_id: 4
)

Recipe.create(
  photo: 'fish-tacos.jpg',
  title: 'Fish Tacos',
  author: 'Miguel H',  
  description: "Love fish tacos? Well, these are the end-all be-all. Read on to see what makes these tacos so special.",
  rating: 4,
  course_id: 5
)

Recipe.create(
  photo: 'spring-rolls.jpg',
  title: 'Fresh Spring Rolls',
  author: 'Sue L',  
  description: "These spring rolls are a refreshing change from the usual fried variety, and have become a family favorite. They are great as a cool summertime appetizer, and are delicious dipped in one or both of the sauces.",
  rating: 5,
  course_id: 4
)

Recipe.create(
  photo: 'bimbap.jpg',
  title: 'Bimbap',
  author: 'Charles Q', 
  description: "Bibimbap (비빔밥) is probably one of the most well-known and beloved Korean dishes to many people. Even if people don’t know anything about Korea, it’s not too difficult to find people who had Bibimbap sometime in their lives.",
  rating: 5,
  course_id: 5
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