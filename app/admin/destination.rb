ActiveAdmin.register Destination, as: 'Destinos' do

  permit_params :name, :name_en, :name_pt_br, :region_id, :about, :about_en, :about_pt_br, :fall_max, :fall_min, :winter_max, :winter_min, :spring_max, :spring_min, :summer_max, :summer_min

  index do
    selectable_column
    id_column
    column :name
    column :region
    column :country
    actions
  end

  filter :name
  filter :region
  filter :country

  form do |f|
    f.inputs "Destino" do
      f.input :region
      f.input :name
      f.input :name_en
      f.input :name_pt_br
      f.input :about
      f.input :about_en, as: :text
      f.input :about_pt_br, as: :text
      f.input :fall_max, wrapper_html: { class: "temperature-field" }
      f.input :fall_min, wrapper_html: { class: "temperature-field" }
      f.input :winter_max, wrapper_html: { class: "temperature-field" }
      f.input :winter_min, wrapper_html: { class: "temperature-field" }
      f.input :spring_max, wrapper_html: { class: "temperature-field" }
      f.input :spring_min, wrapper_html: { class: "temperature-field" }
      f.input :summer_max, wrapper_html: { class: "temperature-field" }
      f.input :summer_min, wrapper_html: { class: "temperature-field" }
    end
    f.actions
  end

  show do |destination|
    h3 'Detalles'
    attributes_table do
      row :id
      row :name
      row :name_en
      row :name_pt_br
      row :region
      row :about
      row :about_en, as: :text
      row :about_pt_br, as: :text
      row :fall_max
      row :fall_min
      row :winter_max
      row :winter_min
      row :spring_max
      row :spring_min
      row :summer_max
      row :summer_min
    end

    table_for destination.excursions do
      column 'Excursiones', :name
    end

    table_for destination.ranches do |ranch|
      column 'Estancias', :name
    end
  end

end



