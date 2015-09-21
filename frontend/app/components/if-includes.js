import Ember from 'ember';

export default Ember.Component.extend({
  isIncluded: function(){
    console.log(list)
    return list.includes(obj);
  }
});
