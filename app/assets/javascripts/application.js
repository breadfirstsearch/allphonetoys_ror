// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require bootstrap-sprockets
//= require rails-ujs
//= require turbolinks
//= require_tree .
$(document).on('turbolinks:load', function() {
  setTimeout(function() {
    $('.alert-success').remove()
    $('.alert-danger').remove()
  }, 3000)

  $("#transaction_pickupDate").change(function() {
    if($(this).val() != "") {
      var str="<option value>When should we recharge?</option>", dates = []
      var months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
      dates[0] = new Date($(this).val().substring(0,12))
      for(var i=1; i<10; i++) {
        dates[i] = new Date(dates[i-1])
        dates[i] = new Date(dates[i].setDate(dates[i].getDate() + 1))
      }
      for (var i=0; i<10; i++) {
        var date = dates[i].getDate()
        var month = months[dates[i].getMonth()]
        var year = dates[i].getFullYear()
        var dateValue = date + " " + month + " " + year
        str += "<option value='" + dateValue + "'>" + dates[i].toDateString() + "</option>"
      }
      $("#transaction_rechargeDate").html(str)
    }
  })
})
