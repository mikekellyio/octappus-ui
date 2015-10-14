import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    let child = this.modelFor('children.show');
    let nextStep = child.get('nextStep');
    return nextStep;
  },
  afterModel(model){
    model.get('children')
  },

  actions: {
    signOff: function(step) {
      var child = this.modelFor("children.show");
      child.get('completedSteps').pushObject(step);
      step.save()
    }
  }
});
