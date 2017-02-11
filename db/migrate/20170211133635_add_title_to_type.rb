class AddTitleToType < ActiveRecord::Migration[5.0]
  def change
    if Type.count == 0
      Type.create( :title => 'Expense' )
      Type.create( :title => 'Income' )
    end
  end
end
