
var counterMonth = 0;
var counterYear = 0;

var common_patern = document.getElementById('post_created_at').value.split(' ');
var pattern = common_patern[0].split('/');
var time = common_patern[1];

var dateCommon = new Date(pattern[2], pattern[1] - 1, pattern[0]);
var day =  dateCommon.getDate(); 
var month = dateCommon.getMonth();
var year = dateCommon.getFullYear();

var nameMonth = ["Січень", "Лютий", "Березень", "Квітень", "Травень", "Червень", "Липень", "Серпень", "Вересень", "Жовтень", "Листопад", "Грудень"];
var nameCaseMonth = ["Січня", "Лютого", "Березня", "Квітня", "Травня", "Червня", "Липня", "Серпня", "Вересня", "Жовтня", "Листопада", "Грудня"];


document.getElementById('created_date').innerHTML = day + " " + nameCaseMonth[month] + " " + year + " року.";

document.getElementById('created_date').onclick = function() {
  getCalendar();
};

document.getElementById('show_calendar').onmouseleave = function() {
	document.getElementById('show_calendar').innerHTML = '';
};

function setNumberDay(value) {
	return (value == 0) ? 6 : --value;
}

function setMonth(value) {
	counterMonth += value;
	getCalendar();
}

function setYear(value) {
	counterYear += value;
	getCalendar();
}

function setDate(object) {
	document.getElementById('created_date').innerHTML = object.getAttribute('date') + " " + nameCaseMonth[month] + " " + year + " року.";
  document.getElementById('post_created_at').value = (object.getAttribute('date') < 10 ? '0' + object.getAttribute('date') : object.getAttribute('date')) + "/" + ((month + 1) < 10 ? '0' + (month + 1) : (month + 1)) + "/" + year + " " + time;
  dateCommon = new Date(year, month, object.getAttribute('date'));
  counterMonth = 0;
  counterYear = 0;    
  getCalendar();
}

function getCalendar() {

	date = new Date(dateCommon.getFullYear() + counterYear, dateCommon.getMonth() + counterMonth);

  day = dateCommon.getDate();
	month = date.getMonth();
  year = date.getFullYear();

  var calendar = "<div class='show_calendar'><table class='calendar'>";
  calendar += "<caption><div class='calendar-month'><span onclick='setMonth(-1)'><</span> " + nameMonth[month];
  calendar += " <span onclick='setMonth(1)'>></span></div>";
  calendar += "<div class='calendar-year'><span onclick='setYear(-1)'><</span> " + year;
  calendar += " <span onclick='setYear(1)'>></span></div></caption>";
  calendar += "<tr><th>Пнд</th><th>Вто</th><th>Срд</th><th>Чтв</th><th>Птн</th><th>Суб</th><th>Нед</th></tr><tr>";

  for(var i = 0; i < setNumberDay(date.getDay()); i++) calendar += "<td>&nbsp;</td>";

  while(date.getMonth() == month) {
  	calendar += ((date.getDate() != day) ? "<td>" : "<td class='day'>") + "<span date='" + date.getDate() +"' onclick=setDate(this)>" + date.getDate() + "</td>";
   	if(setNumberDay(date.getDay()) % 7 == 6) calendar += "</tr><tr>";
   	date.setDate(date.getDate() + 1);
  } 	

  if(setNumberDay(date.getDay()) != 0) for(var i = setNumberDay(date.getDay()); i < 7; i++ ) calendar += "<td>&nbsp;</td>";

  calendar += "</tr></table></div>";

  document.getElementById('show_calendar').innerHTML = calendar;
}