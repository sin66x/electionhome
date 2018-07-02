$(document).ready(function(){

    if (window.location.href.indexOf("terms") >= 0)
    {
        $("#terms").toggleClass("active");
        $("#advertise").toggleClass("");
    }
    else
    {
        $("#terms").toggleClass("");
        $("#advertise").toggleClass("active");
    }
});

function candidateFilterTable(endingColumns,electionId) {
  var input, filter, table, tr, td, i;
  var shouldShow =[];
  input = document.getElementById("myInput"+electionId);
  filter = input.value.toUpperCase();
  table = document.getElementById("myTable"+electionId);
  tr = table.getElementsByTagName("tr");

  for (i = 1; i < tr.length; i++) {
  	for(j=0;j<tr[i].getElementsByTagName("td").length-endingColumns;j++){
    	cellValue = tr[i].getElementsByTagName("td")[j].innerHTML.toUpperCase();
        if (cellValue.indexOf(filter)>-1)
        {
        	shouldShow.push(i);
            j=tr[i].getElementsByTagName("td").length;
        }
    }
  }

  for (i = 1; i < tr.length; i++) {
  	tr[i].style.display = "none";
  }

  for (i = 0; i < shouldShow.length; i++) {
  	tr[shouldShow[i]].style.display = "";
  }
}
