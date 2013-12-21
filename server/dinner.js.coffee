Dishes = new Meteor.Collection("dishes")

Meteor.publish "dishes", ->
  Dishes.find()
