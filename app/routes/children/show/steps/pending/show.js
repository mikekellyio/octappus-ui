import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    return this.store.findRecord('step', params.step_id);
  },
  afterModel(model){
    model.get('children')
  }
});
