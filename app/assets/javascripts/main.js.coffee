### settings block start ###

isMobile_f = ->
  array_mobileIds = new Array('iphone', 'android', 'ipad', 'ipod')
  uAgent = navigator.userAgent.toLowerCase()
  i = 0
  while i < array_mobileIds.length
    if uAgent.search(array_mobileIds[i]) > -1
      isMobile = true
      if array_mobileIds[i] == 'ipad'
        isiPad = true
    i++
  return

init_menu = ->
  $('nav.main_menu a').click (e) ->
    if isMobile
      parent = $(this).parent()
      if (!parent.hasClass('expanded') or $(this).attr('href') == '#') and parent.find('ul').length > 0
        $(this).parent().toggleClass 'expanded'
        e.preventDefault()
    return
  build_responsive_menu()
  return

build_responsive_menu = ->
  $('header nav.main_menu').append '<select />'
  $('header nav.main_menu select').append '<option value="" selected="selected">Navigation</option>'
  $('nav.main_menu li').each ->
    child = $(this)
    lnk = child.find('> a').clone()
    lnk.find('span').remove()
    level = child.parents('ul').length - 1
    dash = ''
    i = 0
    while i < level
      dash += '-'
      i++
    path = lnk.attr('href')
    text = ' ' + dash + ' ' + lnk.text()
    opt = '<option value="' + path + '">' + text + '</option>'
    $('header nav.main_menu select').append opt
    return
  $('header nav.main_menu select').change ->
    window.location = $(this).find('option:selected').val()
    return
  return

init_sticky_footer = ->
  page_height = $('.wrapper').height()
  window_height = $(window).height()
  if page_height <= window_height
    if $('.wrapper').hasClass('sticky_footer')
      $('.wrapper').addClass 'need'
      $('#content > .inner').css 'padding-bottom', $('footer').outerHeight() + 'px'
  return

init_fields = ->
  $('.w_def_text').each ->
    text = $(this).attr('title')
    if $(this).val() == ''
      $(this).val text
    return
  $('.w_def_text').click ->
    text = $(this).attr('title')
    if $(this).val() == text
      $(this).val ''
    $(this).focus()
    return
  $('.w_def_text').blur ->
    text = $(this).attr('title')
    if $(this).val() == ''
      $(this).val text
    return
  $('.custom_select').each ->
    $(this).css 'opacity', '0'
    $(this).parent().append '<span />'
    text = $(this).find('option:selected').html()
    $(this).parent().find('span').html text
    return
  $('.custom_select').change ->
    text = $(this).find('option:selected').html()
    $(this).parent().find('span').html text
    return
  return

init_validation = (target) ->

  validate = (target) ->
    valid = true
    $(target).find('.req').each ->
      if $(this).val() == ''
        valid = false
        $(this).parent().addClass 'errored'
      else
        $(this).parent().removeClass 'errored'
      return
    valid

  $('form.w_validation').submit (e) ->
    valid = validate(this)
    if !valid
      e.preventDefault()
    return
  if target
    return validate(target)
  return

init_pretty_photo = ->
  if !isMobile or isiPad
    $('a[data-rel^=\'prettyPhoto\']').prettyPhoto
      deeplinking: false
      keyboard_shortcuts: false
  return

init_pic_hover = ->
  $('.general_pic_hover_1').each ->
    if !$(this).hasClass('initialized')
      $(this).addClass 'initialized'
    no_fx = $(this).hasClass('no_fx')
    $(this).bind 'mouseenter', (e) ->
      icon = $(this).find('.icons')
      overlay = $(this).find('.info')
      if no_fx
        if !ie8
          overlay.show().css 'opacity', '0'
          overlay.stop(true).delay(10).animate { opacity: 1 }, 200
        else
          overlay.css 'display', 'block'
      else
        overlay.show().css 'opacity', '0'
        overlay.stop(true).animate { opacity: 1 }, 200
        w = $(this).width()
        h = $(this).height()
        x = (e.pageX - $(this).offset().left - (w / 2)) * (if w > h then h / w else 1)
        y = (e.pageY - $(this).offset().top - (h / 2)) * (if h > w then w / h else 1)
        direction = Math.round((Math.atan2(y, x) * 180 / Math.PI + 180) / 90 + 3) % 4

        ###* do your animations here *###

        switch direction
          when 0

            ###* animations from the TOP *###

            icon.css
              'left': '0px'
              'top': '-100%'
              'right': 'auto'
              'bottom': 'auto'
            icon.stop(true).delay(20).animate { top: 0 }, 300
          when 1

            ###* animations from the RIGHT *###

            icon.css
              'left': '100%'
              'top': '0'
              'right': 'auto'
              'bottom': 'auto'
            icon.stop(true).delay(20).animate { left: 0 }, 300
          when 2

            ###* animations from the BOTTOM *###

            icon.css
              'left': '0px'
              'top': 'auto'
              'right': 'auto'
              'bottom': '-100%'
            icon.stop(true).delay(20).animate { bottom: 0 }, 300
          when 3

            ###* animations from the LEFT *###

            icon.css
              'left': 'auto'
              'top': '0'
              'right': '100%'
              'bottom': 'auto'
            icon.stop(true).delay(20).animate { right: 0 }, 300
      return
    $(this).bind 'mouseleave', (e) ->
      icon = $(this).find('.icons')
      overlay = $(this).find('.info')
      if no_fx
        if !ie8
          overlay.stop(true).animate { opacity: 0 }, 200
        else
          overlay.css 'display', 'none'
      else
        w = $(this).width()
        h = $(this).height()
        x = (e.pageX - $(this).offset().left - (w / 2)) * (if w > h then h / w else 1)
        y = (e.pageY - $(this).offset().top - (h / 2)) * (if h > w then w / h else 1)
        direction = Math.round((Math.atan2(y, x) * 180 / Math.PI + 180) / 90 + 3) % 4

        ###* do your animations here *###

        switch direction
          when 0

            ###* animations from the TOP *###

            icon.css
              'left': '0px'
              'top': '0px'
              'right': 'auto'
              'bottom': 'auto'
            icon.stop(true).animate { top: -h }, 300
          when 1

            ###* animations from the RIGHT *###

            icon.css
              'left': 'auto'
              'top': '0px'
              'right': '0px'
              'bottom': 'auto'
            icon.stop(true).animate { right: -w }, 300
          when 2

            ###* animations from the BOTTOM *###

            icon.css
              'left': '0px'
              'top': 'auto'
              'right': 'auto'
              'bottom': '0px'
            icon.stop(true).animate { bottom: -h }, 300
          when 3

            ###* animations from the LEFT *###

            icon.css
              'left': '0px'
              'top': '0px'
              'right': 'auto'
              'bottom': 'auto'
            icon.stop(true).animate { left: -w }, 300
        overlay.stop(true).animate { opacity: 0 }, 200
      return
    return
  return

init_message_boxes = ->
  $('.general_info_box .close').click ->
    $(this).parent().fadeOut 300
    return
  return

init_blog_style_7 = ->
  $('.block_blog_type_7').isotope()
  $(window).resize ->
    $('.block_blog_type_7').isotope 'reLayout'
    return
  return

init_blog_style_8 = ->
  $('.block_blog_type_8').isotope()
  $(window).resize ->
    $('.block_blog_type_8').isotope 'reLayout'
    return
  return

init_faq_filter = ->
  $container = $('#faq_container')
  $container.isotope layoutMode: 'straightDown'
  $('.block_faq #faq_filter a').click (e) ->
    selector = $(this).attr('href')
    if selector == 'all'
      selector = '*'
    else
      selector = '.' + selector
    $container.isotope filter: selector
    $('.block_faq #faq_filter li').removeClass 'active'
    $(this).parent().addClass 'active'
    e.preventDefault()
    return
  $('.block_faq .question').click ->
    $(this).parent().toggleClass 'expanded'
    $(this).next('.answer').toggle()
    $container.isotope 'reLayout'
    return
  return

init_filter = ->
  console.log('A')
  $container = $('#filtered_container')
  $container.isotope()
  $('#filter a').click (e) ->
    console.log($(this).attr('href'))
    selector = $(this).attr('href')
    if selector == 'all'
      selector = '*'
    else
      selector = '.' + selector
    $container.isotope filter: selector
    $('#filter li').removeClass 'active'
    $(this).parent().addClass 'active'
    e.preventDefault()
    return
  $(window).resize ->
    $container.isotope 'reLayout'
    return
  return

init_skills = ->
  $('.block_levels .progress div').each ->
    w = $(this).attr('data-level')
    $(this).animate { width: w + '%' }, 500
    return
  return

init_slider_3 = (target) ->
  old_width = $(target).width()

  init_slider = ->
    $(target).roundabout
      minScale: 0.45
      minOpacity: 1
      childSelector: 'li'
      responsive: true
      btnNext: '.button_next'
      btnPrev: '.button_prev'
    return

  $(window).resize ->
    new_width = $(target).width()
    if old_width != new_width
      old_width = new_width
      $(target).roundabout 'destroy'
      init_slider()
    return
  init_slider()
  return

### settings block end ###

### browser selection ###

ie8 = if navigator.userAgent.match(/msie [8]/i) then true else false
# ie8 = if $.browser.msie and $.browser.version == '8.0' then true else false

### mobile ###

isMobile = false
isiPad = false
isMobile_f()
$(document).ready ->
  init_sticky_footer()
  init_fields()
  init_pic_hover()
  init_validation()
  init_message_boxes()
  init_faq_filter()
  $('.block_to_top a').click (e) ->
    $.scrollTo 0, 500
    e.preventDefault()
    return
  $('.tabel_tooltip').tooltip
    position: 'top right'
    offset: [
      -5
      -25
    ]
    effect: 'fade'
  return
$(window).resize ->
  init_sticky_footer()
  return
$(window).load ->
  init_blog_style_7()
  init_blog_style_8()
  init_filter()
  init_skills()
  init_sticky_footer()
  return
$ ->
  init_menu()
  init_pretty_photo()
  init_sticky_footer()
  $ ->
    $('.block_portfolio_2 .item .image, .block_portfolio_3 .item .image, .block_portfolio_w_sidebar .item .image').bind 'mouseenter', ->
      $(this).find('.info').fadeIn 200
      return
    $('.block_portfolio_2 .item .image, .block_portfolio_3 .item .image, .block_portfolio_w_sidebar .item .image').bind 'mouseleave', ->
      $(this).find('.info').fadeOut 100
      return
    return
  $ ->
    $('.block_portfolio_item_3 .image .frame').bind 'mouseenter', ->
      $(this).find('.hover').fadeIn 200
      return
    $('.block_portfolio_item_3 .image .frame').bind 'mouseleave', ->
      $(this).find('.hover').fadeOut 100
      return
    return
  return
