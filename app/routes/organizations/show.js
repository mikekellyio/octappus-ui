import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    return this.store.findRecord('organization', params.organization_id, { reload: true });
  }
});
