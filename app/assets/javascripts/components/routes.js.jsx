var Route = ReactRouter.Route;
var DefaultRoute = ReactRouter.DefaultRoute;

var MyRoutes = (
  <Route handler={OctApp} path='/'>
    <DefaultRoute handler={Home} />
    <Route name='teams' handler={Teams} path='/teams' >
      <Route name='team' path="/teams/:teamId" component={Team}/>
    </Route>
    <Route name='children' handler={Children} path='/children' >
      <Route name='child' path="/children/:childId" component={Child}/>
    </Route>
  </Route>
);
