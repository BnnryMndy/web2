function getWords() {
    var input = document.getElementById('en-word').value;
    var firstLetter = input.charAt(0);
    var link = location.protocol + '//' + location.host + location.pathname + "dict/" + firstLetter + ".txt";
    if (input != "" && event.keyCode != 13) {
        getContentAJAX(input, link);
    } else if (input != "" && event.keyCode == 13) {
        getContentAJAX(input, link, true);
    }

}

function getTranslate(input) {
    // var regex = new RegExp(input + " \\[[' a-z]*\\] [\.\,\-\_\'\"\@\?\!\:\$ a-zA-Z0-9А-Яа-я()]*", "gmu");
    // var newContentArr = content.match(regex);
    document.getElementById('oplist').innerHTML = '';

    document.getElementById('transcription').innerHTML = input.split(' ')[1];
    document.getElementById('ru-word').innerHTML = input.split(' ')[2];
    document.getElementById('en-word').value = input.split(' ')[0];
}

function uploadDroplist(input, content, isGetTranslate) {
    var regex = new RegExp(input + "[a-z' ]* \\[[' a-z]*\\] [\.\,\-\_\'\"\@\?\!\:\$ a-zA-Z0-9А-Яа-я()]*", "gmu");
    var newContentArr = content.match(regex);
    document.getElementById('oplist').innerHTML = '';
    if (isGetTranslate) {
        getTranslate(newContentArr[0]);
    } else
        for (let index = 0; index < Math.min(+newContentArr.length, 5); index++) {
            document.getElementById('oplist').innerHTML = document.getElementById('oplist').innerHTML +
                `<button onclick="getTranslate(\`` + newContentArr[index] + `\`);" class="btn btn-outline-dark ">` + newContentArr[index].split(' ')[0] + `</button>`;
        };

}

function getContentAJAX(input, link, isGetTranslate = false) {
    var httpRequest;

    console.log(link);

    if (window.XMLHttpRequest) { // Mozilla, Safari, ...
        httpRequest = new XMLHttpRequest();
        httpRequest.overrideMimeType('text/xml');
    } else if (window.ActiveXObject) { // IE
        httpRequest = new ActiveXObject("Microsoft.XMLHTTP");
    }

    httpRequest.onreadystatechange = function() {
        if (httpRequest.status == 200) {
            // upload words to droplist here
            // console.log(httpRequest.responseText);
            uploadDroplist(input, httpRequest.responseText, isGetTranslate);
        } else {

        }
    };

    httpRequest.open('GET', link, true);
    httpRequest.send(null);
}