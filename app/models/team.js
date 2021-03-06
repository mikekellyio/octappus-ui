import DS from 'ember-data';

export default DS.Model.extend({
  name: DS.attr('string'),
  children: DS.hasMany('child'),
  organization: DS.belongsTo('organization')
});
