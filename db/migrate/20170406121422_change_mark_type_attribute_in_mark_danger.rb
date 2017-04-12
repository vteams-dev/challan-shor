class ChangeMarkTypeAttributeInMarkDanger < ActiveRecord::Migration[5.0]
  def change
    change_column(:mark_dangers, :mark_type, :int)
  end
end
