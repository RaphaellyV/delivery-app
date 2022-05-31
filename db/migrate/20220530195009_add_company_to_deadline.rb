class AddCompanyToDeadline < ActiveRecord::Migration[7.0]
  def change
    add_reference :deadlines, :company, null: true, foreign_key: true
  end
end
