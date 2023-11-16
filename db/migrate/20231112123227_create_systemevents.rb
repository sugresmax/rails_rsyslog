class CreateSystemevents < ActiveRecord::Migration[7.1]
  def change
    create_table :systemevents do |t|
      t.datetime :receivedat
      t.datetime :devicereportedtime
      t.string :facility
      t.string :priority
      t.string :fromhost
      t.string :message
      t.string :syslogtag

      t.timestamps
    end
  end
end
