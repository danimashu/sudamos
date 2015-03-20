$ ->
  unless $("#user_professional_true").prop("checked")
    $("#professional").hide()
  $("#user_professional_true").click ->
    $("#professional").slideDown()
  $("#user_professional_false").click ->
    $("#professional").slideUp()