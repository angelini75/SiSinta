# Manejador para remover perfiles asociados con javascript, derivado del de
# awesome_nested_fields
$(document)
  .on 'click', '#miembros .borrar a', (evento) ->
    # Anula el click y el movimiendo de pantalla
    evento.preventDefault()
    # El link y el checkbox son hermanos en el mismo td
    $(this).siblings('input.destroy').prop "checked", true
    $(this).parents('.fila').hide()

jQuery ->
  # Oculto el checkbox y muestro la X, que sólo funciona con js
  $('#miembros .borrar a').toggle()
  $('#miembros .borrar input').toggle()
  $('#x.borrar').toggle()
