$ ->
  $('.country-select').change ->
    country = $(this).val()
    user.changeState(country)

  $('.state-select').change ->
    country = $('.country-select').val()
    state = $(this).val()
    user.changeCity(country, state)

$(document).on 'turbolinks:load', ->
  $('.datepicker').datepicker()

user =
  changeState: (country) ->
    $.get "/locales?country=#{country}", (data) ->
      stateSelect = $('.state-select')
      stateSelect.html('')
      $('.city-box').hide()
      for key, value of data
        stateSelect.append "<option value='#{key}'>#{value}</option>"
        $('.state-box').show()

  changeCity: (country, state) ->
    $.get "/locales?country=#{country}&state=#{state}", (data) ->
      citySelect = $('.city-select')
      citySelect.html('')
      for _, value of data
        citySelect.append "<option value='#{value}'>#{value}</option>"
        $('.city-box').show()
