import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    let child = this.modelFor('children.show');
    let pendingSteps = child.get('filteredPendingSteps');
    return pendingSteps;
  },
  afterModel(model){
    if(model.get('length') === 0){
      this.transitionTo("children.show.steps.completed");
    }
  }
});
