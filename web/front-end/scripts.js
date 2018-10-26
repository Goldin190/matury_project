$(document).ready(function(){
    $(".nav-link").click(function(){
        $(".active").removeClass("active show");
        $(this).addClass("show");
        $(this).addClass("active");
    });
});