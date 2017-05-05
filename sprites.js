/*pexen*/var pexen=document.getElementById('pexen');var pexenStep=0;var pexenPos=0;var pexenTimer=null; 
function nextStep(){ 
var x = 164*pexenStep;
pexen.style.backgroundPosition = "-" + x + "px -0"; 
pexenStep = (pexenStep+1)%5; 
pexenTimer = setTimeout(nextStep, 100) 
}nextStep();
function runPlet() {
var tor = Math.floor(Math.random()*300)+100;
$("#pexen").delay(4000).animate({marginTop: tor},1).animate({marginLeft: "130%"},8000).animate({marginLeft: "-200px"},1, runPlet);}runPlet();

/*belga*/var belga=document.getElementById('belga');var belgaStep=0;var belgaPos=0;var belgaTimer=null; 
function nextStop(){ 
var x = 164*belgaStep;
belga.style.backgroundPosition = "-" + x + "px -0"; 
belgaStep = (belgaStep+1)%8;
belgaTimer = setTimeout(nextStop, 100) 
}nextStop();
function runPlot() {
var tor = Math.floor(Math.random()*300)+100;
$("#belga").delay(6000).animate({marginTop: tor},1).animate({marginRight: "130%"},8000).animate({marginRight: "-200px"},1, runPlot);}runPlot();

/*oxel*/var oxel=document.getElementById('oxel');var oxelStep=0;var oxelPos=0;var oxelTimer=null; 
function nextStap(){ 
var x = 63*oxelStep;
oxel.style.backgroundPosition = "-" + x + "px -0"; 
oxelStep = (oxelStep+1)%7;
oxelTimer = setTimeout(nextStap, 100);
}nextStap();
function runPlat() {
var tor = Math.floor(Math.random()*700)+200;
$("#oxel").delay(9000).animate({marginLeft: tor},1).animate({marginBottom: "100%"},7000).animate({marginBottom: "-200px"},1, runPlat);}runPlat();