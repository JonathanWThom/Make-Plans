var Activity = React.createClass({

  render: function() {
    return (
      <div className="card activity-card">
        <div className="card-block">
          <h4 className="card-title">
            {this.props.activity.title}
          </h4>
          <div className="text-center">
            <i className="fa fa-caret-up"></i>
          </div>
          <div className="text-center display-none">
            <i className="fa fa-caret-down"></i>
          </div>
        </div>
        <img className="card-img-top display-none" src={this.props.activity.image_url} />
        <div className="card-block display-none">
          <p className="card-text">
            {this.props.activity.description}
          </p>
          <SaveActivity user_id={this.props.user_id} activity={this.props.activity} />
        </div>
      </div>
    )
  }
});
