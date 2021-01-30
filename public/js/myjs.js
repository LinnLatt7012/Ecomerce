    maxLength=100;
    var elements = document.getElementsByClassName("seemore");
    for (let index = 0; index < elements.length; index++) {
        truncated = elements[index].innerText;
        if (truncated.length > maxLength) {
        truncated = truncated.substr(0,maxLength) + '...';
        }
        elements[index].innerText = truncated;
        console.log(elements[index]);
    }

