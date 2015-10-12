import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    let child = this.modelFor('children.show');
    let nextStep = child.get('nextStep');
    return nextStep;
  }
});
