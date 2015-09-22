var OctApp = React.createClass({

  render: function() {
    return <div />;
  },
  
  componentDidMount: function(){
    var me = thiss;
    var listener = this.props.getListener();
    
    listener.on("update", function(updated){
      console.log("updated OctApp state");
      me.setProps({store: updated});
    })
  }
});
