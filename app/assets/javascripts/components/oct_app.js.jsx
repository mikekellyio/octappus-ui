var RouteHandler = ReactRouter.RouteHandler;
var OctApp = React.createClass({

  render: function() {
    return (
      <RouteHandler/>
    );
  },

  componentDidMount: function(){
    var me = this;
    /*var listener = store.getListener();

    listener.on("update", function(updated){
      console.log("updated OctApp state");
      me.setProps({store: updated});
    })*/
  }
});
