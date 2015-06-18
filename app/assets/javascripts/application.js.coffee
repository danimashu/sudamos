#= require jquery
#= require jquery_ujs
#= require twitter/bootstrap
#= require jquery.fileupload
#= require_tree .

$ ->
  $(".tooltiped").tooltip()
  $(".buttoned").click ->
    $(".buttoned").button('loading')

  window.setTimeout (->
    $(".alert-dismissable").fadeTo(500, 0).slideUp 500, ->
  ), 5000
