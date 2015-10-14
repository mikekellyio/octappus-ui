import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    this.transitionTo('children.show.steps.next');
  },
  actions: {
    signOff: function(step) {
      this.get('completedSteps').pushObject(step);
      step.save()
    }
  }
});
