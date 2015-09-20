import Ember from 'ember';

export default Ember.Route.extend({
  model(params) {
    var child = this.store.findRecord('child', params.child_id);
    return child;
  },
  afterModel(model) {
    model.get('steps');
    return model.get('pendingSteps');
  }
});
