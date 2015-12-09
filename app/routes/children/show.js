import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    return this.store.findRecord('child', params.child_id, { reload: true });
  },
  afterModel(model){
    model.get('filteredCompletedSteps');
    model.get('filteredPendingSteps');
  },
  actions: {
    signOff: function(step) {
      step.get('children').forEach(function(subStep){
        this.currentModel.get('completedSteps').pushObject(subStep);
        this.currentModel.get('pendingSteps').removeObject(subStep);
      }.bind(this));
      this.currentModel.get('completedSteps').pushObject(step);
      this.currentModel.get('pendingSteps').removeObject(step);

      step.save().then(function(){
        this.currentModel.reload().then(function(){
          this.transitionTo('children.show');
        }.bind(this));
      }.bind(this));
    },
    cancelSignOff: function(step){
      step.get('children').forEach(function(subStep){
        this.currentModel.get('completedSteps').removeObject(subStep);
        this.currentModel.get('pendingSteps').pushObject(subStep);
      }.bind(this));
      this.currentModel.get('completedSteps').removeObject(step);
      this.currentModel.get('pendingSteps').pushObject(step);

      step.save().then(function(){
        this.currentModel.reload().then(function(){
          this.transitionTo('children.show');
        }.bind(this));
      }.bind(this));
    }
  }
});
