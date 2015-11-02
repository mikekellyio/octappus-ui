import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    let org = this.modelFor('organizations.show');
    let teams = org.get('teams');

    return teams;
  }
});
