function getCurrentPage() {
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);

    var currentPageId = urlParams.get('page_id');
    return currentPageId;
}

function setShareableURL(pageId) {
    var page_id = pageId;
    var currUrl = new URL(window.location.href);
    currUrl.searchParams.set('page_id', page_id);
    window.history.pushState("object or string", "Читалка", currUrl);
}

function loadContent() {
    var pageId = getCurrentPage();

    if (pageId == null) {
        pageId = 1;
        setShareableURL(1);
    }

    getContentAJAX(pageId);
}

function appendContent(content) {
    document.getElementById('content').innerHTML = document.getElementById('content').innerHTML + content;
}

function reachedEnd() {
    let newPage = +getCurrentPage() + 1;
    setShareableURL(newPage);
    getContentAJAX(newPage);
}

$(window).scroll(function() {
    if ($(window).scrollTop() + $(window).height() > $(document).height() - 100) {
        reachedEnd();
    }
});

function getContentAJAX(page_id) {
    var httpRequest;
    var link = location.protocol + '//' + location.host + location.pathname + "pages/glava" + page_id + ".html";
    console.log(link);

    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
        httpRequest = new XMLHttpRequest();
        httpRequest.overrideMimeType('text/xml');
    } else if (window.ActiveXObject) { // IE
        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
    }

    httpRequest.onreadystatechange = function() {
        if (httpRequest.status == 200) {
            appendContent(httpRequest.responseText);
        } else {

        }
    };

    httpRequest.open('GET', link, true);
    httpRequest.send(null);
}


document.onload = loadContent();