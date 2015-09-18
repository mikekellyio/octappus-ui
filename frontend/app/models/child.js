import DS from 'ember-data';

export default DS.Model.extend({
  firstname: DS.attr('string'),
  lastname: DS.attr('string'),
  nickname: DS.attr('string'),
  birthday: DS.attr('date'),
  team: DS.belongsTo('team')
});
