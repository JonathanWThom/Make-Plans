var POPULATE = {};

$.extend(POPULATE, {
  setEventTimeFromActivity: {
    init: function() {
      var that = this;
      this.setEventDateTime();

      $("#activity").change(function(){
        that.setEventDateTime();
      })
    },

    setEventDateTime() {
      var activity_id = $("#activity").val();
      if (activity_id) {
        $.getJSON(`/activities/${activity_id}`, function(data){
          $("#event_happening_at_string").val(data.happening_at);
        });
      }
    }
  }
});
