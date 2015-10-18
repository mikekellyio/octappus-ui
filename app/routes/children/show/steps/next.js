import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    let child = this.modelFor('children.show');
    let nextStep = child.get('nextStep');

    return nextStep;
  },
  afterModel(model){
    if(model){
      model.get('children')
    }else{
      this.transitionTo("children.show.steps.completed")
    }
  }
});
