var Activities = React.createClass({

  getInitialState() {
    return {
      activities: [],
      latitude: null,
      longitude: null
    }
  },

  componentWillMount() {
    this.getLocation();
  },

  getLocation() {
    var that = this;
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(function(position) {
        that.setState({
          latitude: position.coords.latitude,
          longitude: position.coords.longitude
        });
        that.getActivities();
      });
    }
  },

  getActivities() {
    var that = this;
    $.getJSON('activities',
    {
      latitude: this.state.latitude,
      longitude: this.state.longitude
    },
    function(data) {
      that.setState({
        activities: data
      })
      that.buildActivities();
    });
  },

  buildActivities(){
    const activities = this.state.activities.map((activity) =>
      <Activity user_id={this.props.user_id} key={activity.id} activity={activity}/>
    );
    return activities;
  },

  render: function() {
    var activities = this.buildActivities(),
      activity_content;

    if (activities.length) {
      activity_content =
        <div>
          <h3 className="display-inline-block">Activities in Your Area</h3>
          {activities}
        </div>
    } else {
      activity_content =
        <div>
          <h3 className="display-inline-block">Searching for activities in your area...</h3>
        </div>  
    }

    return (
      <div className="row">
        <div className="col-sm-5 card-column centered-column">
          <div className="text-center">
            {activity_content}
          </div>
        </div>
      </div>
    )
  }
});
