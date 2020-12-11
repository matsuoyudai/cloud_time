// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(function(){
  ScrollReveal().reveal('.wrap', {
    duration: 1600,
    origin: 'top',
    distance: '50px',
    reset: true
  });
});

$(function(){
  ScrollReveal().reveal('.title', {
    duration: 1600,
    origin: 'top',
    distance: '50px',
    reset: false
  });
});

$(function(){
  $('.header_button').hover(
  function() {
    $(this).animate({
      'font-size': '17px'
    }, 150);
  },
  function() {
    $(this).animate({
      'font-size': '16px'
    }, 150);
  }
);
});

function showClock1() {
  var nowTime = new Date();
  var nowMonth = nowTime.getMonth()+1;
  var nowDate  = nowTime.getDate();
  var nowDay = nowTime.getDay() ; // 曜日(数値)
  var nowDayStr = [ "日", "月", "火", "水", "木", "金", "土" ][nowDay] ; // 曜日(日本語表記)
  var msg = nowMonth + "月" + nowDate + "日" + "(" + nowDayStr + ")";
  if (location.pathname == "/attendances"){document.getElementById("RealtimeClockArea1").innerHTML = msg;}
}
setInterval('showClock1()',1000);

function set2fig(num) {
  // 桁数が1桁だったら先頭に0を加えて2桁に調整する
  var ret;
  if( num < 10 ) { ret = "0" + num; }
  else { ret = num; }
  return ret;
}
function showClock2() {
  var nowTime = new Date();
  var nowHour = set2fig( nowTime.getHours() );
  var nowMin  = set2fig( nowTime.getMinutes() );
  var nowSec  = set2fig( nowTime.getSeconds() );
  var msg = nowHour + ":" + nowMin + ":" + nowSec;
  if (location.pathname == "/attendances"){document.getElementById("RealtimeClockArea2").innerHTML = msg;}
}
setInterval('showClock2()',1000);