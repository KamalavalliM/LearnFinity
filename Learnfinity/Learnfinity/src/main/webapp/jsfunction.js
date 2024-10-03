/**
 * 
 */
function slideshow(){
	var arr = [ "images/slideshow4.PNG", "images/slideshow2.png", "images/slideshow5.jpg"];
  	var idx =0;
  	timer = setInterval(display, 1000);

  function display(){
    if(idx== arr.length)
         idx =0;
    
     var html = "<img src='" + arr[idx] + "' style='height: 300px; width: 100%;' alt='Slideshow Image' />";
    document.getElementById("slide").innerHTML = html;
    ++idx;
  }
}
function validateName(str){
    var nameExpr = /^[a-zA-Z]+(?: [a-zA-Z]+)*$/;
    return nameExpr.test(str);
}

function validateEmail(email) {
    var emailExpr = /^[a-zA-Z0-9]+@[a-zA-Z0-9.-]+\.(com|co\.in)$/;
    return emailExpr.test(email);
}
