# encoding: utf-8
module BusquedasHelper
  def titulo_de_la_accion
    case params[:action]
      when 'index'
        'Búsquedas'
      when 'show'
        "Resultados"
      when 'new'
        'Nueva búsqueda'
      when 'edit'
        "Modificar búsqueda"
      else
        nil
    end
  end

  def subtitulo
    case params[:action]
      when 'show', 'edit'
        "#{@busqueda.nombre}"
      else
        nil
    end
  end
end
