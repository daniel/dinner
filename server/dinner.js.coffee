Dishes = new Meteor.Collection("dishes")

Meteor.publish "dishes", (user_id) ->
  Dishes.find({user_id: user_id})
