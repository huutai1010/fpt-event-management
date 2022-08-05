document.getElementById('btn_nav').onclick = function () {
    let menu = document.getElementById('menu');
    let blur = document.getElementById('blur');
    menu.style.visibility = 'visible';
    blur.style.display = 'block';
    menu.style.opacity = '1';

    blur.onclick = function () {
        menu.style.visibility = 'hidden';
        menu.style.opacity = '0';
        blur.style.display = 'none';

    }
}

var a = document.getElementById("blah");
function readUrl(input) {
    if (input.files) {
        var reader = new FileReader();
        reader.readAsDataURL(input.files[0]);
        reader.onload = (e) => {
            a.src = e.target.result;
        }
    }
}
// sửa
function previewBeforeUpload(id){
    document.querySelector("#"+id).addEventListener("change",function(e){
      if(e.target.files.length == 0){
        return;
      }
      let file = e.target.files[0];
      let url = URL.createObjectURL(file);
      document.querySelector("#"+id+"-preview div").innerText = file.name;
      document.querySelector("#"+id+"-preview img").src = url;
    });
  }
  
  previewBeforeUpload("file-1");