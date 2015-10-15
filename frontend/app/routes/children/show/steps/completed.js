import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    let child = this.modelFor('children.show');
    let completedSteps = child.get('filteredCompletedSteps');
    return completedSteps;
  }
});
