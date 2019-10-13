﻿var user = null;
$(document).ready(function () {
    ReadCategories();
    GetUserInfo();
            .then(function (objUser) {
            });
            .then(function (objProps) {

                userDisplayName = UserInfo.DisplayName;
                console.log('userDisplayName is ' + userDisplayName);

                userEmail = UserInfo.Email;
                console.log('userEmail is ' + userEmail);

                EmpArabicName = UserInfo.UserProfileProperties.AboutMe;
                console.log('EmpArabicName is ' + EmpArabicName);

                Department = UserInfo.UserProfileProperties.Department;
                console.log('Department is ' + Department);

                DM = UserInfo.UserProfileProperties.Manager;
                console.log('DM is ' + DM);

                var webURL = _spPageContextInfo.webAbsoluteUrl;
            });
        width: '60px',
        height: '30px',
        spinButtons: true,
        decimal: 1,
        digits: 2,
        decimalDigits: 0,
        min: 1,
        max: 10,
        promptChar: ''
    });

    $("#btnAddStationeryItemToGrid").on('click', function () {
        AddStationeryItemToGrid();
    });

    var row = {};
    var source = {
        localdata: row,
        datafields: [{
            name: 'Title',
            type: 'string'
        }, {
            name: 'Quantity',
            type: 'string'
        }, {
            name: 'Notes',
            type: 'string'
        }],
        datatype: "array"
    };
    var adapter = new $.jqx.dataAdapter(source);
    $("#jqxgrid").jqxGrid({
        rtl: true,
        width: 600,
        height: 200,
        source: adapter,
        editable: true,
        selectionmode: 'singlerow',
        editmode: 'dblclick',
        columns: [
            {
                text: 'اسم الصنف',
                datafield: 'Title',
                width: 200,
                editable: false,
                align: 'right',
                cellsalign: 'right',
                cellclassname: 'GridCellStyle'
            }, {
                text: 'الكمية',
                datafield: 'Quantity',
                width: 200,
                columntype: 'numberinput',
                align: 'right',
                cellsalign: 'right',
                cellclassname: 'GridCellStyle',
                validation: function (cell, value) {
                    if (value < 1 || value > 10) {
                        return { result: false, message: "لابد أن تكون الكمية من 1 إلى 10" };
                    }
                    return true;
                },
                createeditor: function (row, cellvalue, editor) {
                    editor.jqxNumberInput({ width: '60px', height: '30px', spinButtons: true, decimal: 1, digits: 2, decimalDigits: 0, min: 1, max: 10, promptChar: '' });
                }
            }, {
                text: 'ملاحظات',
                datafield: 'Notes',
                width: 200,
                align: 'right',
                cellsalign: 'right',
                cellclassname: 'GridCellStyle'
            }
        ]  // end of columns
    });
}); // end of document.ready
function GetItemsOfSelectedCat() {

    if (selected_cat === "-1") {
        $("#ddlItem").empty();
        $("#ddlItem").append(
            $('<option></option>').val('-1').html('اختر الصنف المطلوب')
        );
        return;
    }


    var webURL = _spPageContextInfo.webAbsoluteUrl;
    var api = "/_api/web/lists/";
    var query = "GetByTitle('أصناف المخازن')/items?$filter=Category eq '" + selected_cat + "'&$select=Title";
    var fullURL = webURL + api + query;
    var encfullURL = encodeURI(fullURL);

    $.ajax({
        url: encfullURL,
        method: "GET",
        headers: { "Accept": "application/json; odata=verbose" },
        success: function (data) {
            $("#ddlItem").empty();
            for (var i = 0; i < data.d.results.length; i++) {
                var item = data.d.results[i];
                $("#ddlItem").append(
                    $('<option></option>').val(item.Title).html(item.Title)
                );
            }
        },
        error: function (data) {
            alert("Error: " + data);
        }
    });
}