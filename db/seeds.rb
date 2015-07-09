include ActionDispatch::TestProcess

case Rails.env
  when 'development'
    puts 'active admin user'
    User.create(email: 'admin@example.com', password: 'password')
end

case Rails.env

  when 'development', 'production', 'staging'
    puts 'creating countries'
    arg = Country.create!(name: 'Argentina')
    chile = Country.create!(name: 'Chile')

    puts 'creating region'
    baires_r = Region.create!(name: 'Buenos Aires', country: arg)
    patagonia_arg = Region.create!(name: 'Patagonia Argentina', country: arg)
    nor_este_arg = Region.create!(name: 'Noreste Argentino', country: arg)
    cuyo = Region.create!(name: 'Cuyo', country: arg)
    cordoba_r = Region.create!(name: 'Córdoba', country: arg)
    nor_oeste_arg = Region.create!(name: 'Noroeste Argentino', country: arg)

    norte_chileno = Region.create!(name: 'Norte Chileno', country: chile)
    patagonia_ch = Region.create!(name: 'Patagonia Chilena', country: chile)
    santiago_r = Region.create!(name: 'Santiago de Chile', country: chile)


    puts 'creating destinations'
    # ARGENTINA
    bariloche = Destination.create!(name: 'Bariloche', region: patagonia_arg,
      fall_max: 10, fall_min: 2, winter_max: 7, winter_min: -1,
      spring_max: 21, spring_min: 8, summer_max: 30, summer_min:11)

    calafate = Destination.create!(name: 'El Calafate', region: patagonia_arg,
      fall_max: 9, fall_min: 2, winter_max: 7, winter_min: -5,
      spring_max: 10, spring_min: 2, summer_max: 18, summer_min: 8)

    chalten = Destination.create!(name: 'El Chalten', region: patagonia_arg,
      fall_max: 9, fall_min: 2, winter_max: 7, winter_min: -5,
      spring_max: 10, spring_min: 2, summer_max: 18, summer_min: 8)

    esquel = Destination.create!(name: 'Esquel', region: patagonia_arg,
      fall_max: 15, fall_min: 2, winter_max: 7, winter_min: -2,
      spring_max: 20, spring_min: 7, summer_max: 27, summer_min: 9)

    madryn = Destination.create!(name: 'Puerto Madryn', region: patagonia_arg,
      fall_max: 20, fall_min: 6, winter_max: 12, winter_min: 2,
      spring_max: 21, spring_min: 10, summer_max: 35, summer_min: 18)

    angostura = Destination.create!(name: 'Villa La Angostura y Villa Traful', region: patagonia_arg,
      fall_max: 10, fall_min: 2, winter_max: 7, winter_min: -1,
      spring_max: 20, spring_min: 7, summer_max: 28, summer_min: 10)

    sanmartin = Destination.create!(name: 'San Martín de los Ándes', region: patagonia_arg,
      fall_max: 14, fall_min: 3, winter_max: 10, winter_min: 3,
      spring_max: 20, spring_min: 7, summer_max: 27, summer_min: 9)

    bolson = Destination.create!(name: 'El Bolsón', region: patagonia_arg,
      fall_max: 10, fall_min: 2, winter_max: 7, winter_min: -1,
      spring_max: 20, spring_min: 7, summer_max: 27, summer_min: 9)

    ushuaia = Destination.create!(name: 'Ushuaia', region: patagonia_arg,
      fall_max: 6, fall_min: 1, winter_max: 5, winter_min: -1,
      spring_max: 11, spring_min: 2, summer_max: 18, summer_min: 6)

    iguazu = Destination.create!(name: 'Iguazú', region: nor_este_arg)
    mendoza = Destination.create!(name: 'Mendoza y San Rafael', region: cuyo)
    cordoba = Destination.create!(name: 'Córdoba', region: cordoba_r)
    pehuenia = Destination.create!(name: 'Villa Pehuenia', region: patagonia_arg)
    salta = Destination.create!(name: 'Salta y Jujuy', region: nor_oeste_arg)
    tucuman = Destination.create!(name: 'Tucumán', region: nor_oeste_arg)
    san_juan = Destination.create!(name: 'San Juan', region: cuyo)
    baires = Destination.create!(name: 'Buenos Aires', region: baires_r)

    # CHILE
    punta_arenas = Destination.create!(name: 'Punta Arenas', region: patagonia_ch)
    natales = Destination.create!(name: 'Puerto Natales', region: patagonia_ch)
    paine = Destination.create!(name: 'Torres del Paine', region: patagonia_ch)
    santiago = Destination.create!(name: 'Santiago de Chile', region: santiago_r)
    montt = Destination.create!(name: 'Puerto Montt', region: patagonia_ch)
    varas = Destination.create!(name: 'Puerto Varas', region: patagonia_ch)
    atacama = Destination.create!(name: 'San Pedro de Atacama', region: patagonia_ch)


    # cruceros
    puts 'creating cruises'
    cruceros_arg = Cruise.create!(name: 'Cruceros Argentinos', region: baires_r)
    cruce_andino = Cruise.create!(name: 'Cruce Andino', region: patagonia_arg)
    cruceros_ch = Cruise.create!(name: 'Cruceros Chilenos', region: patagonia_ch)

    #ESTOS SON DE PRUEBA
    puts 'creating FAKE estancias'
    Ranch.create!(name: 'Estancia de prueba Angostura A', destination: angostura)
    Ranch.create!(name: 'Estancia de prueba Angostura B', destination: angostura)
    Ranch.create!(name: 'Estancia de prueba Baires 1', destination: angostura)
end
