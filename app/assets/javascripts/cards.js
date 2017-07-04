var CARDS = {};

$.extend(CARDS, {
  toggleCardInfo: {
    init: function() {
      $("body").on("click", ".fa-caret-up", function() {
        $(this).parents(".card").find(".hidden").show();
        $(this).hide();
      });

      $("body").on("click", ".fa-caret-down", function() {
        $(this).parents(".card").find(".hidden").hide();
        $(this).parents(".card").find(".fa-caret-up").show();
      })
    }
  }
});
