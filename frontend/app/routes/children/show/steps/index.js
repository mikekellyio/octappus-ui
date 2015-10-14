import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    this.transitionTo('children.show.steps.next');
  }
});
