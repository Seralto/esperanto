$(document).on 'turbolinks:load', ->
  $('.country-select').change ->
    country = $(this).val()
    user.changeState(country)

  $('.state-select').change ->
    country = $('.country-select').val()
    state = $(this).val()
    user.changeCity(country, state)

  $('.datepicker').datepicker({ changeMonth: true, changeYear: true, yearRange: "-100:-5" });

user =
  changeState: (country) ->
    $.get "/locales?country=#{country}", (data) ->
      stateSelect = $('.state-select')
      stateSelect.html('')
      $('.city-box').hide()
      stateSelect.append "<option value=''>Bonvolu elekti</option>"
      for key, value of data
        stateSelect.append "<option value='#{key}'>#{value}</option>"
        $('.state-box').show()

  changeCity: (country, state) ->
    $.get "/locales?country=#{country}&state=#{state}", (data) ->
      citySelect = $('.city-select')
      citySelect.html('')
      citySelect.append "<option value=''>Bonvolu elekti</option>"
      for _, value of data
        citySelect.append "<option value='#{value}'>#{value}</option>"
        $('.city-box').show()
