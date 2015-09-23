var TeamListItem = React.createClass({

  render: function() {
    var team = this.props.team;
    return (
      <li>
        {team.name}
      </li>
    );
  }
});
