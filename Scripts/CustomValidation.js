// Range Validation of Maximum and Minimum Values for Enums
$.validator.addMethod(
    'validateenum',
    function (value, element, params) {
        var minRange = parseInt(params.minimumrange);
        var maxRange = parseInt(params.maximumrange);
        var selectedValue = parseInt(value);
        return (selectedValue >= minRange && selectedValue <= maxRange);
    });
$.validator.unobtrusive.adapters.add(
    'validateenum', ['minimumrange', 'maximumrange'], function (options) {
        var params = {
            minimumrange: options.params.minimumrange,
            maximumrange: options.params.maximumrange
        };
        options.rules['validateenum'] = params;
        options.messages['validateenum'] = options.message;
    });

// Maximum and Minimum date Validation
$.validator.addMethod(
    'validatedate',
    function (value, element, params) {
        var minRange = params.minumumdate;
        var maxRange = params.maximumdate;
        var minDate = new Date();
        var maxDate = new Date();
        var dateParts = minRange.split('-');
        minDate.setFullYear(dateParts[2]);
        minDate.setMonth(parseInt(dateParts[1], 10));
        minDate.setDate(dateParts[0]);
        var maxdateParts = maxRange.split('-');
        maxDate.setFullYear(maxdateParts[2]);
        maxDate.setMonth(parseInt(maxdateParts[1], 10));
        maxDate.setDate(maxdateParts[0]);
        var selectedDate = new Date(value);
        return (Date.parse(selectedDate) >= Date.parse(minDate) && Date.parse(selectedDate) <= Date.parse(maxDate));
    });

$.validator.unobtrusive.adapters.add(
    'validatedate', ['minumumdate', 'maximumdate'], function (options) {
        var params = {
            minumumdate: options.params.minumumdate,
            maximumdate: options.params.maximumdate
        };
        options.rules['validatedate'] = params;
        options.messages['validatedate'] = options.message;
    });
    $.validator.addMethod(
        'date',
        function(value, element, params) {
            if (this.optional(element)) {
                return true;
            };
            try {
                Date.parse(value, "dd/mm/yyyy");
                return true;
            } catch (err) {
               return false;
            }
           
        }
    );
