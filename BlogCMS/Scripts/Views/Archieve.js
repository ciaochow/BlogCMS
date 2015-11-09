$(document).ready(function () {

    loadArchieve();

    $(".archieve li").on('click', function () {

        window.location.href = "/Home/ListByMonth?id=" + $(this).text();

        //var URL = "/API/categoryAPI/";

        //alert($(this).val());

        //$.ajax({
        //    type: "Get",
        //    url: URL,
        //    datatype: "json",
        //    success: function (postList) {
        //        alert("got it");
        //        window.location.href = "/Home/ListByCategory?id=" + $(this).text();
        //        //showPostList();  
        //    },
        //    fail: function() {
        //        alert("no good");
        //    },
        //    data: { category : $(this).text() },
        //    async: false
        //});

    });

});

function loadArchieve() {
    //$('#category1').html("hihihihihi");
    var URL = "/API/ArchieveAPI/";

    $.ajax({
        type: "Get",
        url: URL,
        dataType: "json",
        success: function (archieves) {
            BuildArchieveLinks(archieves);
        },
        fail: function () {
            $('#archieve2').html("Load fail!");
        },
        data: {},
        async: false
    });

}

function BuildArchieveLinks(archieves) {

    var URL = "/Home/ListByMonth/";

    var archieve1 = $('#archieve1');
    var archieve2 = $('#archieve2');

  

    var archievelist1 = $("<div></div>").addClass("archieve");
    var archievelist2 = $("<div></div>").addClass("archieve");

    $.each(archieves, function (index, archieve) {

        if (index % 2 === 0) {

            archievelist1.append($("<li></li>").html($("<a></a>").attr("href", URL + archieve.ArchieveID).text(archieve.Month).val(archieve.ArchieveID)));
        } else {

            archievelist2.append($("<li></li>").html($("<a></a>").attr("href", URL + archieve.ArchieveID).text(archieve.Month).val(archieve.ArchieveID)));
        }
    });

    archieve1.append($("<ul></ul>").addClass("list-unstyled").append(archievelist1));
    archieve2.append($("<ul></ul>").addClass("list-unstyled").append(archievelist2));
}
