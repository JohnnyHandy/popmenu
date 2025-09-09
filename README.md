# Popmenu Interview Test


## Level 1
Added the **Menu** and **MenuItem** Models and basic tests for controllers and models.

## Level 2
Added the **Restaurant** model, and also the **Item** model: here, since the **MenuItem** could be on multiple **Menu**s of a **Restaurant**, and to have it on a **Menu** it must belong to a **Menu** model, I decided to create the **Item** model and make the **MenuItem** to be an intermediary model relation between it and the **Menu** model. For the **Restaurant** and **Item** models, basic model and controller specs were added.

## Level 3
Here I decided to add some database and model validations for unique **Restaurant** name, and unique name, scope to restaurant, model and database validations for **Menu** and **Item** models. The respective model validations mentioned also received testing cases on the spec/models folder. Also created the *import_json_data* endpoint and a *ImportRestaurantData*, in which both will allow the creation of a **Restaurant**, its **Menus** and its **Items**, where the latter can have its price updated through the json file. A service spec file was created to test thee creation and update behavior mentioned.