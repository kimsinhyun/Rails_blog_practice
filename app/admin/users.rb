ActiveAdmin.register User do

  # @todo: 해당 filter 를 안 넣으면 ransack 에러가 난다. (이유는 아직 모름)
  filter :post

  index do
    selectable_column
    id_column

    column :email
  end

  show do
    attributes_table do
      row :email
      row :views
    end
  end
  
end
