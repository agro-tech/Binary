let _ = document.querySelector.bind(document);
let _all = document.querySelectorAll.bind(document);

var typeWriter = function(e, t) {
  _(e).textContent = "";
  var text = t.split("");
  var count = 0;
  var symbol = "_";
  var time;
  var type = function(){
    if(count < text.length){
      _(e).textContent = _(e).textContent.replace(symbol, '') + text[count];
      if((count + 1) < text.length) _(e).textContent = _(e).textContent + symbol;
      count++;
    }else{
      clearInterval(time);
    }
  }
  time = setInterval(type, 50);
};

var fadeIn = function(el, t) {
  _(el).classList.remove("in");
  _(el).classList.add("out");
  setTimeout(function(){
    _(el).classList.remove("out");
    _(el).classList.add("in");
    typeWriter(el, t);
  },1000);
}
setTimeout(function(){
  var timer = 2500;
  setTimeout(function(){
    fadeIn('.welcome',"Hello!");
    _(".pre-load").classList.add("loaded");
  }, timer);
  setTimeout(function(){
    fadeIn('.welcome', "Thank you for visiting!");
    _(".scroll").classList.add("in");
  }, timer*2);
  setTimeout(function(){
    fadeIn('.welcome', "Alan Ramos");
    _(".scroll").classList.add("in");
  }, timer*3);
  setTimeout(function(){
    fadeIn('.sub', "Web Developer");
    _(".scroll").classList.add("in");
  }, timer*3.25);

}, 1000);
