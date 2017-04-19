class EquipoDecorator < ApplicationDecorator
  def to_s
    source.nombre
  end

  def miembro_preparado
    source.miembros.build
  end
end
