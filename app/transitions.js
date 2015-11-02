// app/transitions.js
export default function() {
  this.transition(
    this.fromRoute('children.show.steps.next'),
    this.use('toDown'),
    this.debug()
  );
  this.transition(
    this.fromRoute('children.show.steps.pending'),
    this.toRoute('children.show.steps.completed'),
    this.use('crossFade'),
    this.reverse('crossFade'),
    this.debug()
  );
  this.transition(
    this.fromRoute('children.show.steps.completed'),
    this.toRoute('children.show.steps.next'),
    this.use('crossFade'),
    this.reverse('crossFade'),
    this.debug()
  );
}
