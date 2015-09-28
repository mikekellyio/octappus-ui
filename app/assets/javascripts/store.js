var API = '/api/teams';
var _store = new Freezer({});
var _changeListeners = [];
var _initCalled = false;

var TeamStore = {
  init: function () {
    if (_initCalled)
      return;

    _initCalled = true;

    _store.get().getListener().on("update", function(updated){
      console.log("updated store");
    });

    getJSON(API, function (err, res) {
      if(err == null){
        _store.get().set({errors: {}})
        _store.get().set(res)

        TeamStore.notifyChange();
      }
    });
  },

  findAll: function(refresh){
    if(refresh){
      return new Promise((resolve, reject) => {
        getJSON(API, function (err, res) {
          if(err == null){
            _store.get().set({errors: {}})
            resolve(_store.get().set(res))
            TeamStore.notifyChange();
          }else{
            reject(_store.get().set(err));
          }
        });
      });
    }else{
      return Promise.resolve(_store.get(teams));
    }
  },

  //return a Promise for a team from store, otherwise try to fetch it from server.
  find: function(id) {
    var team = _.find(_store.get().teams, function(t){return t.id == id})
    if(team){
      return Promise.resolve(team);
    }else {
      return new Promise((resolve, reject) => {
        getJSON(API + "/" + id, function(err, res){
          if(!!err){
            reject(_store.get().set(err));
          }else{
            resolve(_store.get().teams.push(res.team))
          }
        })
      });
    }
  },

  persist: function(){
    putJSON(API, _store.get(), function (err, res) {
      if(err == null){
        _store.get().set({errors: {}})
        _store.get().set(data)

        TeamStore.notifyChange();
      }
    });
  },

  refresh: function(){
    getJSON(API, function (err, res) {
      if(err == null){
        _store.get().set({errors: {}})
        _store.get().set(data)

        TeamStore.notifyChange();
      }
    });
  },

  notifyChange: function () {
    _changeListeners.forEach(function (listener) {
      listener();
    });
  },

  addChangeListener: function (listener) {
    _changeListeners.push(listener);
  },

  removeChangeListener: function (listener) {
    _changeListeners = _changeListeners.filter(function (l) {
      return listener !== l;
    });
  }
}

function getJSON(url, cb){
  $.ajax({
    url: url, //endpoint url
    type: "GET",
    dataType: "json",
    error: function(data){
      //growl here?
      var errors = $.parseJSON(data.responseText)
      console.log(errors)
      cb(errors)
    },
    success: function(data){
      //growl success
      cb(null, data)
    }
  })
}

function putJSON(url, store, cb){
  $.ajax({
    url: url, //endpoint url
    type: "PUT",
    dataType: "json",
    data: store.toJS(),
    error: function(data){
      //growl here?
      var errors = $.parseJSON(data.responseText)
      console.log(errors)
      cb(errors)
    },
    success: function(data){
      //growl success
      cb(null, data)
    }
  })
}
