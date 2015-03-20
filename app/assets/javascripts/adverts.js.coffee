$ ->
  $(".sm-image").click (e) ->
    e.preventDefault()
    $("#main-image img").hide()
    $($(this).attr("href")).fadeIn(100)