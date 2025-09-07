# Popmenu Interview Test


## Level 1
Added the **Menu** and **MenuItem** Models and basic tests for controllers and models.

## Level 2
Added the **Restaurant** model, and also the **Item** model: here, since the **MenuItem** could be on multiple **Menu**s of a **Restaurant**, and to have it on a **Menu** it must belong to a **Menu** model, I decided to create the **Item** model and make the **MenuItem** to be an intermediary model relation between it and the **Menu** model. For the **Restaurant** and **Item** models, basic model and controller specs were added.