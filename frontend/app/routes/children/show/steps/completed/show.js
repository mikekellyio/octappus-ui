import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    return this.store.findRecord('step', params.step_id);
  },
  afterModel(model){
    model.get('children')
  }
});
