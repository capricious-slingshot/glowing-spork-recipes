# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship 
- [x] Include at least one belongs_to relationship 
- [x] Include at least two has_many through relationships 
- [x] Include at least one many-to-many relationship 
- [x] The "through" part of the has_many through includes at least one user submittable attribute, that is to say, some attribute other than its foreign keys that can be submitted by the app's user 
- [x] Include reasonable validations for simple model objects (models should defend against invalid data)
- [ ] Include a class level ActiveRecord scope method (Your scope method must be chainable, meaning that you must use ActiveRecord Query methods within it (.where and .order) rather than native ruby methods (#find_all or #sort).)
- [x] Include signup
- [x] Include login
- [x] Include password handling
- [x] Include logout
- [x] Include third party signup/login (e.g. Devise/OmniAuth)
- [ ] Include nested resource show or index (URL e.g. users/2/recipes)
- [ ] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new)
- [x] Include form validation errors 
- [x] Include fields should be enclosed within a fields_with_errors class
- [x] Include error messages describing the validation failures present within the view
Confirm:
- [x] The application is pretty DRY
- [x] Logic present in your controllers should be encapsulated as methods in your models
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate