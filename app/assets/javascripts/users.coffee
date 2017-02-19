$(document).on 'turbolinks:load', ->
  $('.country-select').change ->
    country = $(this).val()
    user.changeState(country)

  $('.state-select').change ->
    country = $('.country-select').val()
    state = $(this).val()
    user.changeCity(country, state)

  $('.datepicker').datepicker({
    changeMonth: true,
    hangeYear: true,
    yearRange: "-100:-5"
  });

  $(".dropdown").select2({
      theme: "bootstrap"
  });

  user.initializeSelect2()

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
      stateSelect.focus()

  changeCity: (country, state) ->
    $.get "/locales?country=#{country}&state=#{state}", (data) ->
      citySelect = $('.city-select')
      citySelect.html('')
      citySelect.append "<option value=''>Bonvolu elekti</option>"
      for _, value of data
        citySelect.append "<option value='#{value}'>#{value}</option>"
        $('.city-box').show()
      citySelect.focus()

  initializeSelect2: ->
    $('.select2').select2
      language: noResults: ->
        return 'Neniu rezulto trovita'
