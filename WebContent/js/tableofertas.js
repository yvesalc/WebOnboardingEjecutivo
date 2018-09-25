(function ($) {

    var datatable = $('.table').dataTable({
            "columns": [
              { "name": "id" },
              { "name": "age" },
              { "name": "qty" },
              { "name": "cost" },
            ],
            "bPaginate": false,
            "fnRowCallback": function (nRow, aData, iDisplayIndex, iDisplayIndexFull) {
                var setCell = function(response, newValue) {
                  var table = new $.fn.dataTable.Api('.table');
                  var cell = table.cell('td.focus');
                  var cellData = cell.data();
                  
                  var div = document.createElement('div');
                  div.innerHTML = cellData;
                  var a = div.childNodes;
                  a.innerHTML = newValue;
                  
                  console.log('jml a new ' + div.innerHTML);
                  cell.data(div.innerHTML);
                                    
                  // This is huge cheese, but the a has lost it's editable nature.  Do it again.
                  $('td.focus a').editable({ 
                    'mode': 'popup',
                    'success' : setCell
                    });
                };
                $('.editable').editable(
                  { 
                    'mode': 'popup',
                    'success' : setCell
                  }
                );
            },
            "autoFill" : {
                "columns" : [1, 2]
            },
            "keys" : true
        });

})(jQuery);