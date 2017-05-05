$(window).load(function() {//documento-listo
//HOME
var IE6 = $.browser.msie && parseFloat($.browser.version) < 7;var url = "no-ie/index.html";
var IE7 = $.browser.msie && parseFloat($.browser.version) > 7;
if(IE6==true){$(location).attr('href',url);}
if(IE7==true){$("#no-ie").fadeIn(400);}
function runEt() { //Funcion Titileo de NO TAN
$(".titl").animate({opacity: ".19"},900);$(".titl").animate({opacity: ".90"},900, runEt);}
runEt();//Loop
function runIt() { //Funcion Galeria de Imagenes
$(".f_01").delay(100).fadeIn(600).delay(3000).fadeOut(600);$(".f_02").delay(5000).fadeIn(600).delay(3000).fadeOut(600);$(".f_03").delay(9100).fadeIn(600).delay(3000).fadeOut(600);$(".f_04").delay(13100).fadeIn(600).delay(3000).fadeOut(600);$(".f_05").delay(17100).fadeIn(600).delay(3000).fadeOut(600, runIt);}
runIt();//Loop
//Navegacion
$("#p01").mouseenter( function() {$(this).animate({marginRight: "90px"},300);}).mouseleave(function(){$(this).animate({marginRight: "0"},300);});
$("#p02").mouseenter( function() {$(this).animate({marginRight: "90px"},300);}).mouseleave(function(){$(this).animate({marginRight: "0"},300);});
$("#p03").mouseenter( function() {$(this).animate({marginRight: "90px"},300);}).mouseleave(function(){$(this).animate({marginRight: "0"},300);});
$("#p04").mouseenter( function() {$(this).animate({marginRight: "80px"},300);}).mouseleave(function(){$(this).animate({marginRight: "0"},300);});
$("#digice").mouseenter( function() {$(this).animate({marginLeft: "70px"},300);}).mouseleave(function(){$(this).animate({marginLeft: "0"},300);});
//FLORA-FAUNA
$(".p_exen").click( function() {$(".pexen").fadeIn(500);$(".oxel").fadeOut(500);$(".stringer").fadeOut(500);$(".belga").fadeOut(500);$(".lote").fadeOut(500)});
$(".o_xel").click( function() {$(".pexen").fadeOut(500);$(".oxel").fadeIn(500);$(".stringer").fadeOut(500);$(".belga").fadeOut(500);$(".lote").fadeOut(500)});
$(".s_tringer").click( function() {$(".pexen").fadeOut(500);$(".oxel").fadeOut(500);$(".stringer").fadeIn(500);$(".belga").fadeOut(500);$(".lote").fadeOut(500)});
$(".b_elga").click( function() {$(".pexen").fadeOut(500);$(".oxel").fadeOut(500);$(".stringer").fadeOut(500);$(".belga").fadeIn(500);$(".lote").fadeOut(500)});
$(".l_ote").click( function() {$(".pexen").fadeOut(500);$(".oxel").fadeOut(500);$(".stringer").fadeOut(500);$(".belga").fadeOut(500);$(".lote").fadeIn(500)});
//ANOTACIONES
$(".res_1").click( function() {$(".1_abril").fadeIn(500);$(".5_abril").fadeOut(500);$(".13_mayo").fadeOut(500);$(".2_junio").fadeOut(500);});
$(".res_2").click( function() {$(".1_abril").fadeOut(500);$(".5_abril").fadeIn(500);$(".13_mayo").fadeOut(500);$(".2_junio").fadeOut(500);});
$(".res_3").click( function() {$(".1_abril").fadeOut(500);$(".5_abril").fadeOut(500);$(".13_mayo").fadeIn(500);$(".2_junio").fadeOut(500);});
$(".res_4").click( function() {$(".1_abril").fadeOut(500);$(".5_abril").fadeOut(500);$(".13_mayo").fadeOut(500);$(".2_junio").fadeIn(500);});
//GALERIA
$(".marco_gal a").click( function() {$(".blackp").fadeIn(400);});
$(".blackp").click( function() {$(this).fadeOut(400);$(".t_img").fadeOut(350)});
$(".b0").click( function() {$(".a0").fadeIn(700);});$(".b1").click( function() {$(".a1").fadeIn(700);});$(".b2").click( function() {$(".a2").fadeIn(700);});$(".b3").click( function() {$(".a3").fadeIn(700);});$(".b4").click( function() {$(".a4").fadeIn(700);});$(".b5").click( function() {$(".a5").fadeIn(700);});$(".b6").click( function() {$(".a6").fadeIn(700);});$(".b7").click( function() {$(".a7").fadeIn(700);});$(".b8").click( function() {$(".a8").fadeIn(700);});$(".b9").click( function() {$(".a9").fadeIn(700);});$(".b10").click( function() {$(".a10").fadeIn(700);});$(".b11").click( function() {$(".a11").fadeIn(700);});
//EVENTOBARRADEESPACIO
$("body").keypress(function(e){e.preventDefault();if(e.which == '32'){$("#limpio").delay(700).animate({top: "-2px"},300).delay(5000).animate({top: "-30px"},300);}});
//BROWER
if($.cookie("browser") != "si"){$("#browser").animate({marginLeft: "70px"},800).delay(6000).animate({marginLeft: "0"},1000);$.cookie("browser", "si", { path: '/' });}
//COOKIES 
valor = $.cookie("digicenosis");
if(valor == "galeria"){$(".posicionada").fadeOut(1);$(".saber").fadeIn(1);$("#thing").fadeIn(1);}
});//documento-cerrado