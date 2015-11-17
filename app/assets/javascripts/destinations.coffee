# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(window).load ->
  $('#slider_portfolio_item_1').flexslider
    animation: 'fade'
    controlNav: true
    directionNav: true
    animationLoop: true
    slideshow: true
    useCSS: false
    slideshowSpeed: 3000
    pauseOnAction: false
  return

