class ConvertirFotosEnAdjuntos < ActiveRecord::Migration
  def up
    rename_table :fotos, :adjuntos

    change_table :adjuntos do |t|
      t.attachment :archivo
    end
  end

  def down
    drop_attached_file :adjuntos, :archivo

    rename_table :adjuntos, :fotos
  end
end
