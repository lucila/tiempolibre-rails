ActiveAdmin.register Region, as: 'Regiones' do

  permit_params :name, :name_en, :name_pt_br, :country_id

  index do
    selectable_column
    id_column
    column :name
    column :country
    actions
  end

  filter :name
  filter :country

  form do |f|
    f.inputs "Region" do
      f.input :country
      f.input :name
      f.input :name_en
      f.input :name_pt_br
    end
    f.actions
  end

  show do |region|
    h3 'Detalles'
    attributes_table do
      row :id
      row :country
      row :name
      row :name_en
      row :name_pt_br
    end

    table_for region.destinations do
      column 'Destinos', :name
    end
  end

end
