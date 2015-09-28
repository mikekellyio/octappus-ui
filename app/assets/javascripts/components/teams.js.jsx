var Teams = React.createClass({
  getInitialState: function() {
    return {
      teams: null
    }
  },

  componentDidMount: function() {
    // fetch data initially in scenario 2 from above
    this.fetchTeams()
  },

  componentWillUnmount: function() {
    // allows us to ignore an inflight request in scenario 4
    this.ignoreLastFetch = true
  },

  fetchTeams: function() {
    var url = `/api/teams`
    $.getJSON(url, function(data) {
      if (this.isMounted() && !this.ignoreLastFetch) {
        this.setState({ teams: data.teams })
      }
    }.bind(this));
  },

  render: function() {
    var teams = ""
    var ListGroup = ReactBootstrap.ListGroup
    console.log(teams)
    if(this.state.teams){
      teams = this.state.teams.map(function(team){
        return (
          <TeamListItem team={team} key={team.name}/>
        )
      })
    }
    return (
      <ListGroup>
        {teams}
      </ListGroup>
    );
  }
});
