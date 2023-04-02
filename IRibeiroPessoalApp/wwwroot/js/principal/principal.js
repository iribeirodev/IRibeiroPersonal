$(document).ready(function () {
    registerUser();
    loadSections();
    loadAbout();
})

const getSiteLanguage = function () {
    if (!sessionStorage.getItem("abbreviation"))
        sessionStorage.setItem("abbreviation", "ptBR");
    return sessionStorage.getItem("abbreviation");
}

const setSiteLanguage = function (newAbbreviation) {
    sessionStorage.setItem("abbreviation", newAbbreviation);
    loadSections();
    loadAbout();
    loadContactFields();

    $(".navbar-toggler").click();
}

const registerUser = function () {
    $.post("/IP/PostIP", null, function (result) {
        if (result) {
            console.log(result);
        }
    })
    .fail(function (response) {
        console.log('Error: ' + response.responseText);
    });
}

const loadAbout = function () {
    var url = "/Language/GetAbout";
    var abbreviation = getSiteLanguage();

    $.get(url, { abbreviation: abbreviation }, function (data) {
        if (data) {
            $("#aboutTitle").text(data.presentationTitle);
            $("#aboutText").html(data.presentationText);
        }
    });
}

const loadSections = function () {
    var url = "/Language/GetSections";
    var abbreviation = getSiteLanguage();

    $.get(url, { abbreviation: abbreviation }, function (data) {
        if (data) {
            $("#linkTitle").text(data[0].sectionName);
            $("#linkAbout").text(data[1].sectionName);
            $("#linkArticles").text(data[2].sectionName);
            $("#linkContact").text(data[3].sectionName);
        }
    });
}