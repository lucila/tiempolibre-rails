ActiveAdmin.register Ranch, as: 'Estancias' do

  permit_params :name, :name_en, :name_pt_br, :destination_id, :about, :about_en, :about_pt_br

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
    f.inputs "Ranch" do
      f.input :destination
      f.input :name
      f.input :name_en
      f.input :name_pt_br
      f.input :about
      f.input :about_en, as: :text
      f.input :about_pt_br, as: :text
    end
    f.actions
  end

  show do |ranch|
    h3 'Detalles'
    attributes_table do
      row :id
      row :destination
      row :region
      row :country
      row :name
      row :name_en
      row :name_pt_br
      row :about
      row :about_en
      row :about_pt_br
    end
  end

end
