var CARDS = {};

$.extend(CARDS, {
  toggleCardInfo: {
    init: function() {
      $("body").on("click", ".fa-caret-up", function() {
        $(this).parents(".card").find(".display-none").show();
        $(this).hide();
      });

      $("body").on("click", ".fa-caret-down", function() {
        $(this).parents(".card").find(".display-none").hide();
        $(this).parents(".card").find(".fa-caret-up").show();
      })
    }
  }
});
