import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    let child = this.modelFor('children.show');
    let pendingSteps = child.get('pendingSteps');
    return pendingSteps;
  }
});
