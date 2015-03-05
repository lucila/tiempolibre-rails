include ActionDispatch::TestProcess

case Rails.env

  when 'development', 'production', 'staging'
    puts 'creating destinations'
    Destination.create!(name: 'Bariloche',
      about: 'Sobre la costa meridional del lago Nahuel Huapi, comprendida dentro del Parque Nacional Nahuel Huapi, y a 760 msnm, se encuentra la cuidad de San Carlos de Bariloche; una de las ciudades más pobladas de la provincia de Rió Negro, y uno de los centros turísticos más importantes de la Republica Argentina.',
      about_en: 'On the southern shore of Lake Nahuel Huapi National Park falls within the Nahuel Huapi, and 760 m, is the city of San Carlos de Bariloche, one of the most populated cities in the province of Black River, and one of the resorts most important in Argentina.',
      about_br: 'Na margem sul do Lago Nahuel Huapi National Park cai dentro do lago Nahuel Huapi, e 760 m, a cidade de San Carlos de Bariloche, uma das cidades mais povoadas da provincia de Rio Negro, e um dos resorts mais importante da Argentina.',
      fall_max: 10, fall_min: 2, winter_max: 7, winter_min: -1,
      spring_max: 21, spring_min: 8, summer_max: 30, summer_min:11)
end
