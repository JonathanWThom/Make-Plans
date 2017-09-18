var SaveActivity = React.createClass({
  saveActivity() {
    var that = this;
    $.post(
      `/users/${this.props.user_id}/activities`,
      {
        activity: this.props.activity
      }
    )
    .success(function() {
      window.location.replace(`/users/${that.props.user_id}`);
    });
  },

  render: function() {
    return (
      <a onClick={() => this.saveActivity()}>Save this activity for later</a>
    )
  }
});
