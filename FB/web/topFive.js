

$(function(){
    
   $.getJSON(
    'score'
    , function(result){
        // result sarebbe la lista ostia contenente i risultati
        var result_table = $("#result_table > tbody");
        $(result).each(function(i, item){
            var row_table=
                    "<tr>"
                    + "<td>" + item.Username + "</td>"
                    + "<td>" + item.Score + "</td>"
                    + "<td>" + item.Timestamp + "</td>"
                    + "</tr>";
                   
            result_table.append(row_table);
        });
    }
   
            
    ); 
    
    
});