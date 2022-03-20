function getCurrentPage() {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);

    var currentPageId = urlParams.get('page_id');
    console.log(currentPageId);
    return currentPageId;
}

function loadPage(pageId) {
    setShareableURL(pageId);
}

function setShareableURL(pageId) {
    var page_id = pageId;
    console.log(window.location.href);
    var currUrl = new URL(window.location.href);
    currUrl.searchParams.set('page_id', page_id);
    window.history.pushState("object or string", "Читалка", currUrl);
    loadContent();
}

function loadContent() {
    var pageId = getCurrentPage();
    console.log(location.protocol + '//' + location.host + location.pathname + "pages/0" + pageId + ".html");
    var httpRequest;
    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
        httpRequest = new XMLHttpRequest();
        httpRequest.overrideMimeType('text/xml');
    } else if (window.ActiveXObject) { // IE
        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
    }

    httpRequest.onreadystatechange = function() {
        if (httpRequest.status == 200) {
            document.getElementById('content').innerHTML = httpRequest.responseText;
        } else {
            document.getElementById('content').innerHTML = "Ошибка загрузки контента";
            console.log(httpRequest.r);
        }

    };

    httpRequest.open('GET', location.protocol + '//' + location.host + location.pathname + "pages/0" + pageId + ".html", true);
    httpRequest.send(null);
}

document.onload = loadContent();