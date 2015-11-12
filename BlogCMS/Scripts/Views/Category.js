$(document).ready(function () {

    loadCategory();

});

function loadCategory() {
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

    var URL = "/Home/ListByCategory/";

    var category1 = $('#category1');
    var category2 = $('#category2');

    var categorylist1 = $("<div></div>").addClass("category");
    var categorylist2 = $("<div></div>").addClass("category");

    $.each(categories, function (index, category) {

        if (index % 2 === 0) {       
            categorylist1.append($("<li></li>").html($("<a></a>").attr("href", URL + category.CategoryID).text(category.CategoryName).val(category.CategoryID)));          
        } else {           
            categorylist2.append($("<li></li>").html($("<a></a>").attr("href", URL + category.CategoryID).text(category.CategoryName).val(category.CategoryID)));
        }
    });

    category1.append($("<ul></ul>").addClass("list-unstyled").append(categorylist1));
    category2.append($("<ul></ul>").addClass("list-unstyled").append(categorylist2));
}
