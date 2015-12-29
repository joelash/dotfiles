// Configuration for https://github.com/sdegutis/Phoenix

// FUN!

lookOfDisapproval="ಠ_ಠ";
rageOfDongers="ヽ༼ ಠ益ಠ ༽ﾉ";
whyLook="ლ(ಠ_ಠლ)";
tableFlip="(╯°□°)╯︵ ┻━┻"

// Adjust window size

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

function fullScreen() {
  var win = Window.focusedWindow();
  var screenFrame = Window.focusedWindow().screen().frameWithoutDockOrMenu();
  win.setFrame(screenFrame);
}

function nearRightEdge() {
  var win = Window.focusedWindow();
  var frame = win.frame();
  var screenFrame = win.screen().frameWithoutDockOrMenu();
  return (frame.x + frame.width + 15) >= screenFrame.width;
}

function shrinkRight() {
  var win = Window.focusedWindow();
  var frame = win.frame();
  var screenFrame = win.screen().frameWithoutDockOrMenu();
  var quarterScreen = (screenFrame.width / 4.0);
  if (frame.width > quarterScreen) {
    frame.width = frame.width - quarterScreen;
    win.setFrame(frame);
  }
}

function expandRight() {
  var win = Window.focusedWindow();
  var frame = win.frame();
  var screenFrame = win.screen().frameWithoutDockOrMenu();
  var quarterScreen = (screenFrame.width / 4.0);
  if (!nearRightEdge()) {
    frame.width = frame.width + quarterScreen;
    win.setFrame(frame);
  }
}

function fullHeight() {
  var win = Window.focusedWindow();
  var frame = win.frame();
  var screenFrame = Window.focusedWindow().screen().frameWithoutDockOrMenu();
  if ((frame.height + 15) >= screenFrame.height) {
    frame.height = 2 * (screenFrame.height / 3);
  } else {
    frame.y = screenFrame.y;
    frame.height = screenFrame.height;
  }
  win.setFrame(frame);
}


// Move windows between monitors

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

function circularLookup(array, index) {
  if (index < 0)
    return array[array.length + (index % array.length)];
  return array[index % array.length];
}

function rotateMonitors(offset) {
  var win = Window.focusedWindow();
  var currentScreen = win.screen();
  var screens = [currentScreen];
  for (var x = currentScreen.previousScreen(); x != win.screen(); x = x.previousScreen()) {
    screens.push(x);
  }

  screens = _(screens).sortBy(function(s) { return s.frameWithoutDockOrMenu().x; });
  var currentIndex = _(screens).indexOf(currentScreen);
  moveToScreen(win, circularLookup(screens, currentIndex + offset));
}

function leftOneMonitor() {
  rotateMonitors(-1);
}

function rightOneMonitor() {
  rotateMonitors(1);
}


// Start/select apps
App.allWithTitle = function( title ) {
  return _(this.runningApps()).filter( function( app ) {
    if (app.title() === title) {
      return true;
    }
  });
};


App.focusOrStart = function ( title ) {
  var apps = App.allWithTitle( title );
  if (_.isEmpty(apps)) {
    api.alert(rageOfDongers + " Starting " + title);
    api.launch(title)
    return;
  }

  var windows = _.chain(apps)
    .map(function(x) { return x.allWindows(); })
    .flatten()
    .value();

  activeWindows = _(windows).reject(function(win) { return win.isWindowMinimized();});
  if (_.isEmpty(activeWindows)) {
    api.alert(whyLook + " All windows minimized for " + title);
    api.launch(title)
    return;
  }

  activeWindows.forEach(function(win) {
    win.focusWindow();
  });
};


var mash = ['alt', 'ctrl'];
api.bind('left', mash, leftOneMonitor);
api.bind('right', mash, rightOneMonitor);

var mash = ['alt', 'cmd', 'ctrl'];
api.bind('left', mash, shrinkRight);
api.bind('right', mash, expandRight);

var altCmd = ['alt', 'cmd'];
api.bind('left', altCmd, function() { toLeft(1, 2);});
api.bind('right', altCmd, function() { toRight(1, 2);});
api.bind('down', altCmd, fullHeight);
api.bind('f', altCmd, fullScreen);


var cmdCtrl = ['ctrl', 'cmd'];
api.bind('t', cmdCtrl, function() {App.focusOrStart('iTerm');});
//api.bind('e', cmdCtrl, function() {App.focusOrStart('Emacs');});
//api.bind('b', cmdCtrl , function() {App.focusOrStart('Google Chrome');});
api.bind('m', cmdCtrl , function() {App.focusOrStart('Slack');});
api.bind('x', cmdCtrl , function() {App.focusOrStart('Xcode');});
api.bind('p', cmdCtrl , function() {App.focusOrStart('Path Finder');});
api.bind('z', cmdCtrl , function() {App.focusOrStart('Zoom.us');});
api.bind('c', cmdCtrl , function() {App.focusOrStart('Fantastical 2');});
api.bind('b', cmdCtrl , function() {App.focusOrStart('Mailbox (Beta)');});
api.bind('f', cmdCtrl , function() {App.focusOrStart('Safari');});

