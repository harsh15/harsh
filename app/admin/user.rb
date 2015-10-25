ActiveAdmin.register User do

  index do
    column :id
    column :name
    column :email
    column :date_of_birth
    column :gender
    column :city
    column :state
    actions
  end

end
