function copyToClipboard() {
    var textToCopy = document.getElementById("cmd-div").innerText;

    // Create a temporary textarea element
    var tempTextArea = document.createElement("textarea");
    tempTextArea.value = textToCopy;
    
    // Append the textarea to the body (it must be part of the document to be selectable)
    document.body.appendChild(tempTextArea);
    
    // Select the text inside the textarea
    tempTextArea.select();
    tempTextArea.setSelectionRange(0, 99999); // For mobile devices
    
    // Copy the text to the clipboard
    document.execCommand("copy");
    
    // Remove the temporary textarea
    document.body.removeChild(tempTextArea);
    
    //update icon
    var buttonIcon = document.getElementById("btn-icon");
    
    buttonIcon.src = "https://cdn.getminted.cc/check.png";

    setTimeout(() => {

      }, 2000);



}