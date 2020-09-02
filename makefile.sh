echo Please run this in the directory you wish to install The Digital Clock in!

read -n 1 -s -r -p "If you are ready, press any key to continue."

mkdir Clock

cd Clock

cat << eof > "index.html"
<!DOCTYPE html>
<html>
<head>
	<title>Clock</title>
	<link href="style.css" rel="stylesheet">
</head>
	<body bgcolor="black">
	<script src="clock.js"></script>
</body>
</html>
eof

cat << eof > "clock.js"
function printTime() {
  //Defines Variables
  var d = new Date();
  var hours = d.getHours();
  var mins = d.getMinutes();
  var secs = d.getSeconds();
  var milli = Math.ceil(d.getMilliseconds());
  var year = d.getFullYear() - 2000;
  var month = d.getMonth() + 1;
  var Day = d.getDate();
  var amOrPm = null;
  //Changes the time format from 24-hr to 12-hr
    if (hours >= 13){
    hours -= 12
    amOrPm = "PM"
  }
  else{
    amOrPm = "AM"
  }
  document.body.innerHTML = hours+":"+mins+":"+secs+"."+milli+" "+amOrPm+"<br>"+month+"/"+Day+"/"+year;
}
setInterval(printTime, 1);
eof

cat << eof > "style.css"
body {
	color: green;
	text-align: center;
}
eof

echo Done!

read -n 1 -s -r -p "Press any key to continue."