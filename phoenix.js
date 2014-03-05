// Configuration for https://github.com/sdegutis/Phoenix

function randomInt (min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
};

// FUN!

lookOfDisapproval="ಠ_ಠ";
rageOfDongers="ヽ༼ ಠ益ಠ ༽ﾉ";
whyLook="ლ(ಠ_ಠლ)";

looks=[lookOfDisapproval, rageOfDongers, whyLook];

function randomLook() {
  return looks[randomInt(0, looks.length -1)];
};

// Movement

function toLeft(fillCols, maxCols) {
  var win = Window.focusedWindow();
  var frame = win.frame();
  var screenFrame = win.screen().frameWithoutDockOrMenu();
  frame.y = screenFrame.y;
  frame.x = screenFrame.x;
  frame.height = screenFrame.height;
  frame.width = screenFrame.width * (fillCols / maxCols);
  win.setFrame(frame);
}

function toRight(fillCols, maxCols) {
  var win = Window.focusedWindow();
  var frame = win.frame();
  var screenFrame = win.screen().frameWithoutDockOrMenu();
  frame.y = screenFrame.y;
  frame.x = screenFrame.x + screenFrame.width * (fillCols / maxCols);
  frame.height = screenFrame.height;
  frame.width = screenFrame.width * (1 - fillCols / maxCols);
  win.setFrame(frame);
}

function moveToScreen(win, screen) {
  if (!screen) {
    return;
  }

  var frame = win.frame();
  var oldScreenRect = win.screen().frameWithoutDockOrMenu();
  var newScreenRect = screen.frameWithoutDockOrMenu();

  var xRatio = newScreenRect.width / oldScreenRect.width;
  var yRatio = newScreenRect.height / oldScreenRect.height;

  win.setFrame({
    x: (Math.round(frame.x - oldScreenRect.x) * xRatio) + newScreenRect.x,
    y: (Math.round(frame.y - oldScreenRect.y) * yRatio) + newScreenRect.y,
    width: Math.round(frame.width * xRatio),
    height: Math.round(frame.height * yRatio)
  });
}

function fullScreen() {
  var win = Window.focusedWindow();
  var screenFrame = Window.focusedWindow().screen().frameWithoutDockOrMenu();
  win.setFrame(screenFrame);
}

function leftOneMonitor() {
  var win = Window.focusedWindow();
  moveToScreen(win, win.screen().previousScreen());
}

function rightOneMonitor() {
  var win = Window.focusedWindow();
  moveToScreen(win, win.screen().nextScreen());
}


var mash = ['alt', 'cmd', 'ctrl'];
api.bind('left', mash, leftOneMonitor);
api.bind('right', mash, rightOneMonitor);

var altCmd = ['alt', 'cmd'];
api.bind('left', altCmd, function() { toLeft(1, 2);});

api.bind('right', altCmd, function() { toRight(1, 2);});

api.bind('f', altCmd, fullScreen);


var cmdCtrl = ['ctrl', 'cmd'];

api.bind('c', cmdCtrl, function() {
  App.focusIfRunning('iTerm');
});

api.bind('e', cmdCtrl, function() {
  App.focusIfRunning('Emacs');
});

api.bind('b', cmdCtrl , function() {
  App.focusIfRunning('Google Chrome');
});

api.bind('m', cmdCtrl , function() {
  App.focusIfRunning('Slack');
});


App.allWithTitle = function( title ) {
  return _(this.runningApps()).filter( function( app ) {
    if (app.title() === title) {
      return true;
    }
  });
};


App.focusIfRunning = function ( title ) {
  var apps = App.allWithTitle( title );
  if (_.isEmpty(apps)) {
    api.alert(title + " not running." + randomLook());
    return;
  }


  var windows = _.chain(apps)
    .map(function(x) { return x.allWindows(); })
    .flatten()
    .value();

  activeWindows = _(windows).reject(function(win) { return win.isWindowMinimized();});
  if (_.isEmpty(activeWindows)) {
    api.alert(randomLook() +" All windows minimized for " + title);
    return;
  }

  activeWindows.forEach(function(win) {
    win.focusWindow();
  });
};
