export function initialize(registry, application) {
  // application.inject('route', 'foo', 'service:foo');
  application.inject('adapter', 'session', 'service:session');
}

export default {
  name: 'session',
  initialize
};
