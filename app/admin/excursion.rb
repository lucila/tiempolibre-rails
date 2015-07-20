ActiveAdmin.register Excursion, as: 'Excursiones' do

  permit_params :name, :name_en, :name_pt_br, :destination_id, :description, :description_en, :description_pt_br

  index do
    selectable_column
    id_column
    column :name
    column :destination
    column :region
    actions
  end

  filter :name
  filter :destination
  filter :region
  filter :country

  form do |f|
    f.inputs "Excursion" do
      f.input :destination
      f.input :name
      f.input :name_en
      f.input :name_pt_br
      f.input :description
      f.input :description_en, as: :text
      f.input :description_pt_br, as: :text
    end
    f.actions
  end

  show do |excursion|
    h3 'Detalles'
    attributes_table do
      row :id
      row :destination
      row :region
      row :country
      row :name
      row :name_en
      row :name_pt_br
      row :description
      row :description_en
      row :description_pt_br
    end
  end

end
