var TeamListItem = React.createClass({

  render: function() {
    var team = this.props.team;
    var ListGroupItem = ReactBootstrap.ListGroupItem
    return (
      <ListGroupItem>
        {team.name}
      </ListGroupItem>
    );
  }
});
