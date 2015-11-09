$(document).ready(function () {

    loadCategory();

    //$(".category li").on('click', function () {

        //window.location.href = "/Home/ListByCategory?id=" + $(this).text();

        //    //var URL = "/API/categoryAPI/";

        //    //alert($(this).val());

        //    //$.ajax({
        //    //    type: "Get",
        //    //    url: URL,
        //    //    datatype: "json",
        //    //    success: function (postList) {
        //    //        alert("got it");
        //    //        window.location.href = "/Home/ListByCategory?id=" + $(this).text();
        //    //        //showPostList();  
        //    //    },
        //    //    fail: function() {
        //    //        alert("no good");
        //    //    },
        //    //    data: { category : $(this).text() },
        //    //    async: false
        //    //});

    //});

});

function loadCategory() {
    //$('#category1').html("hihihihihi");
    var URL = "/API/CategoryAPI/";

    $.ajax({
        type: "Get",
        url: URL,
        dataType: "json",
        success: function (categories) {
            BuildCategoriesLinks(categories);
        },
        fail: function () {
            $('#category2').html("Load fail!");
        },
        data: {},
        async: false
    });

}

function BuildCategoriesLinks(categories) {

    //var URL = "/API/CategoryAPI/";
    var URL = "/Home/ListByCategory/";

    var category1 = $('#category1');
    var category2 = $('#category2');

    //category1.append($("<ul></ul>").addClass("list-unstyled"));
    //category2.append($("<ul></ul>").addClass("list-unstyled"));

    //<ul class="list-unstyled">
    //                       <li>
    //                           <a href="#">Category Name</a>
    //                       </li>
    //                       <li>
    //                           <a href="#">Category Name</a>
    //                       </li>
    //                       <li>
    //                           <a href="#">Category Name</a>
    //                       </li>
    //                       <li>
    //                           <a href="#">Category Name</a>
    //                       </li>
    //                   </ul>

    var categorylist1 = $("<div></div>").addClass("category");
    var categorylist2 = $("<div></div>").addClass("category");

    $.each(categories, function (index, category) {

        if (index % 2 === 0) {
            //categorylist = category1;
            categorylist1.append($("<li></li>").html($("<a></a>").attr("href", URL + category.CategoryID).text(category.CategoryName).val(category.CategoryID)));
            //categorylist1.append($("<li></li>").html($("<a></a>").text(category.CategoryName).val(category.CategoryID)));
        } else {
            //categorylist = category2;
            categorylist2.append($("<li></li>").html($("<a></a>").attr("href", URL + category.CategoryID).text(category.CategoryName).val(category.CategoryID)));
            //categorylist2.append($("<li></li>").html($("<a></a>").text(category.CategoryName).val(category.CategoryID)));
        }
    });

    category1.append($("<ul></ul>").addClass("list-unstyled").append(categorylist1));
    category2.append($("<ul></ul>").addClass("list-unstyled").append(categorylist2));
}
