show_movie = ->
  setTimeout(->
    $('.step1').hide()
    $('.step2').removeClass('d-none')
    $('.step2').show()
  , 6000)
  setTimeout(->
    $('.step2').hide()
    $('.step3').removeClass('d-none')
    $('.step3').show()
  , 14000)
  setTimeout(->
    $('.step3').hide()
    $('.step4').removeClass('d-none')
    $('.step4').show()
  , 24000)
  setTimeout(->
    $('.step4').hide()
    $('.step5').removeClass('d-none')
    $('.step5').show()
  , 28000)
  setTimeout(->
    $('.step0').hide()
    $('.step6').removeClass('d-none')
    $('.step6').show()
  , 33000)
  false
  
$(document).on 'turbolinks:load', show_movie
