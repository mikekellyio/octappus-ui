import Ember from 'ember';

export default Ember.Route.extend({
  model(params) {
    var team = this.store.findRecord('team', params.team_id)
    return team;
  }
});
