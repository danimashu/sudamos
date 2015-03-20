$ ->
  $('#fileupload').fileupload
    dataType: "script"
    add: (e, data) ->
      types = /(\.|\/)(jpe?g|png)$/i
      file = data.files[0]
      if !types.test(file.type) && !types.test(file.name)
        alert("#{file.name} no tiene el formato permitido de imagen: jpeg or png.")
      else if file.size > 2100000
        alert("La imagen es demasiado grande, el límite es 2 MB")
      else
        data.submit()
    start: ->
      $('.progress').fadeIn()
    always: ->
      $('.progress').fadeOut()
    progress: (e, data) ->
      progress = parseInt(data.loaded / data.total * 100, 10)
      $('.progress-bar').css('width', progress + '%')