let editor = ace.edit("editor");
editor.setTheme("ace/theme/monokai");
editor.setFontSize(20);
editor.getSession().setMode("ace/mode/markdown");
editor.getSession().setUseWrapMode(true);
editor.getSession().setTabSize(2);
editor.$blockScrolling = Infinity;
editor.setOptions({
    enableBasicAutocompletion: true,
    enableSnippets: true,
    enableLiveAutocompletion: true
});
let editor_button = document.getElementById("editor_button");
let preview_button = document.getElementById("preview");
let content_preview = document.querySelector(".content-preview");
let editor_area = document.getElementById("editor");
editor_button.addEventListener("click", function () {
    content_preview.style.display = "none";
    editor_area.style.display = "block";
    preview_button.setAttribute("class", "");
    editor_button.setAttribute("class", "active");
});
preview_button.addEventListener("click", function () {
    content_preview.style.display = "block";
    editor_area.style.display = "none";
    preview_button.setAttribute("class", "active");
    editor_button.setAttribute("class", "");
    content_preview.innerHTML = marked(editor.getValue());
    document.querySelectorAll("pre code").forEach(function (block, i, ar) {
        hljs.highlightBlock(block);
    });
});
document.getElementById("editor").addEventListener("keyup",function(){
    document.getElementById("editor_value").value = editor.getValue()
});
document.getElementById("post-name").addEventListener("blur", function () {
    fetch(`/apis/name_check?name=${document.getElementById("post-name").value}`, {
        method: "get"
    }).then(function (response) {
        if (response.status === 200) {
            response.json().then(data => {
                if (data == false) {
                    alert(`${document.getElementById("post-name").value}は既に使用されています。違うものにしてください。`);
                };
            });
            
        } else {
        };
    }).catch(function (response) {
    });
});