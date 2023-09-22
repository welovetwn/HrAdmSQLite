var _me = {

    init: function () {        
        //set Datatables config
        var config = {
            columns: [
                { data: 'ProjectCode', orderable: true },
                { data: 'TableCode', orderable: true },
                { data: 'Code', orderable: true },
                { data: 'Name' },
                { data: 'DataType' },
                { data: '_Fun' },
                { data: 'Status', orderable: true },
            ],
            columnDefs: [
                { targets: [5], render: function (data, type, full, meta) {
                    return _crudR.dtCrudFun(full.Id, full.Name, true, true, false);
                }},
                { targets: [6], render: function (data, type, full, meta) {
                    return _crudR.dtStatusName(data);
                }},
            ],
        };

        //init crud
        _crudR.init(config); 
    },

}; //class