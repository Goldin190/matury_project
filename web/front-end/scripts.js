
    $(document).ready(function(){
    $(".nav-link").click(function(){
        $("a").removeClass("active show");
        $(this).addClass("show");
        $(this).addClass("active");
        $("div.dropdown").setAttribute("aria-extended","true");
    });
    $("button.dropdown-toggle.matury").click(function(){
       $("div.matury").addClass("show");
       $("div.matura-menu").addClass("show");
        $("div.nauczyciele").removeClass("show");
        $("div.nauczyciele-menu").removeClass("show");
    });
    $("button.dropdown-toggle.nauczyciele").click(function(){
        $("div.nauczyciele").addClass("show");
        $("div.nauczyciele-menu").addClass("show");
        $("div.matury").removeClass("show");
       $("div.matura-menu").removeClass("show");
    })
});