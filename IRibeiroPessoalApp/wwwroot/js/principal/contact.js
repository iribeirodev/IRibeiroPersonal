const loadContactFields = function () {
    var url = "/Language/GetContactFields";
    var abbreviation = getSiteLanguage();

    $.get(url, { abbreviation: abbreviation }, function (data) {
        if (data) {
            $("#page_title").text(data[0].fieldValue);
            $("#page_subtitle").text(data[1].fieldValue);
            $("#contact_subtitle").text(data[2].fieldValue);
        }
    });
}

loadContactFields();