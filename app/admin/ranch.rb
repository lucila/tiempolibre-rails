ActiveAdmin.register Ranch, as: 'Estancias' do

  permit_params :name, :name_en, :name_pt_br, :destination_id, :about, :about_en, :about_pt_br,
                pictures_attributes: [:id, :image, :remote_image_url, :_destroy]

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

  form html: { enctype: "multipart/form-data" } do |f|
    f.inputs "Ranch" do
      f.input :destination
      f.input :name
      f.input :name_en
      f.input :name_pt_br
      f.input :about
      f.input :about_en, as: :text
      f.input :about_pt_br, as: :text
      if f.object.id.present?
        f.has_many :pictures do |ff|
          ff.input :image, hint: ff.template.image_tag(ff.object.image.url(:thumb)), wrapper_html: { class: 'admin-form-image' }
          ff.input :remote_image_url
          ff.input :_destroy, as: :boolean, required: false, label: 'Eliminar'
        end
      end
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
      render '/admin/shared/image_thumbs', pictures: ranch.pictures
    end
  end

end
