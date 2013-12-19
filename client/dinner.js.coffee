Dishes = new Meteor.Collection("dishes")

Template.dinner.Dishes = ->
  Dishes.find {user_id: Meteor.userId()},
    sort:
      score: 1
      name: 1

Template.dinner.selected_name = ->
  dish = Dishes.findOne(Session.get("selected_dish"))
  dish and dish.name

Template.dish.selected = ->
  (if Session.equals("selected_dish", @_id) then "selected" else "")

Template.dinner.events "click input.add": ->
  name = $('#js-new-dish-name').val()
  return unless name
  Dishes.insert
    name: name
    score: 0
    user_id: Meteor.userId()
  $('#js-new-dish-name').val('')

Template.dinner.events "click input.inc": ->
  Dishes.update Session.get("selected_dish"),
    $inc:
      score: 1

Template.dinner.events "click input.reset": ->
  Dishes.update Session.get("selected_dish"),
    $set:
      score: 0

Template.dinner.events "click input.remove": ->
  return unless confirm("Are you sure?")
  Dishes.remove Session.get("selected_dish"),

Template.dish.events click: ->
  Session.set "selected_dish", @_id


