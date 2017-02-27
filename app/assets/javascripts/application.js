//= require jquery
//= require jquery_ujs
//= require jquery.turbolinks
//= require turbolinks
//= require turbolinks-compatibility
//= require moment
//= require bootstrap-sprockets
//= require bootstrap-datetimepicker
//= require_tree .

DATE_FORMAT = 'YYYY-MM-DD';

document.addEventListener("turbolinks:load", function () {
    if ($('li.active').html() != undefined) {
        $('li.active').removeClass('active');
    }
    $('a[href="' + location.pathname + '"]').parent('li').addClass('active');
});

$(document).on('page:change', function(){
    $(".flash").delay(2000).slideUp(500, function(){
        $(".flash").alert('close');
    });
});

moment.updateLocale('en', {
    week: { dow: 1 }
})

// Bootstrap 3 Datepicker v4
$(document).ready((function () {
    $('#finance_action_date').datetimepicker({
        format: DATE_FORMAT
    });
}));


$(document).ready((function () {
    $('#search_from_date, #report_start_date').datetimepicker({
        format: DATE_FORMAT
    });

    $('#search_to_date, #report_end_date').datetimepicker({
        useCurrent: false,//Important! See issue #1075
        format: DATE_FORMAT
    });

    $("#search_from_date, #report_start_date").on("dp.change", function (e) {
        $('#search_to_date, #report_end_date').data("DateTimePicker").minDate(e.date);
    });
    $("#search_to_date, #report_end_date").on("dp.change", function (e) {
        $('#search_from_date, #report_start_date').data("DateTimePicker").maxDate(e.date);
    });
}));
