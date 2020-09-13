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
let editor_area = document.getElementById("editor")
editor_button.addEventListener("click",function(){
    content_preview.style.display="none";
    editor_area.style.display = "block";
    preview_button.setAttribute("class","");
    editor_button.setAttribute("class","active");
});
preview_button.addEventListener("click",function(){
    content_preview.style.display="block";
    editor_area.style.display="none";
    preview_button.setAttribute("class","active");
    editor_button.setAttribute("class","");
    content_preview.innerHTML = marked(editor.getValue());
});
