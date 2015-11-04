$(document).ready(function() {
   
    loadCategory();

});

function loadCategory() {
    $('#category1').html("hihihihihi");
    var URL = "/API/CategoryAPI/";

    $.ajax({
        type: "Get",
        url: URL,
        dataType: "json",
        success: function (catergories) {

            //$('#modelbox').val("");
            //$('#addmodelbox').addClass("hidden");
            //$('#modellist select').append($("<option></option>").val(model.ModelID).html(model.Model1));
            //$('#addmodelbox').addClass("hidden");
        },
        fail: function () {

        },
        data: { },
        async: false
    });

}