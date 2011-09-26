$(function() {
  $("#contacts_search input").keyup(function() {
    $.get($("#contacts_search").attr("action"), $("#contacts_search").serialize(), null, "script");
    return false;
  });
});