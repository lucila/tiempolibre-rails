ActiveAdmin.register Country do

  permit_params :name, :name_en, :name_pt_br

  index do
    selectable_column
    id_column
    column :name
    actions
  end

  filter :name

  form do |f|
    f.inputs "País" do
      f.input :name
      f.input :name_en
      f.input :name_pt_br
    end
    f.actions
  end

  show do |country|
    h3 'Detalles'
    attributes_table do
      row :id
      row :name
      row :name_en
      row :name_pt_br
    end
  end


end
