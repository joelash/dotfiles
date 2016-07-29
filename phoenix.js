// Configuration for https://github.com/sdegutis/Phoenix

// FUN!

var lookOfDisapproval="ಠ_ಠ";
var rageOfDongers="ヽ༼ ಠ益ಠ ༽ﾉ";
var whyLook="ლ(ಠ_ಠლ)";
var tableFlip="(╯°□°)╯︵ ┻━┻";
var fuDude="╭∩╮（︶︿︶）╭∩╮";

function showCenteredModal(message, offset) {
  var m = new Modal();
  m.duration = 2;
  m.message = message;

  var sFrame = Screen.main().visibleFrameInRectangle();
  var mFrame = m.frame();

  var mX = Math.round((sFrame.width / 2) - (mFrame.width / 2));
  var mY = Math.round((sFrame.height / 2) - (mFrame.height / 2));
  if (!offset) {
    offset = {x: 0, y: 0};
  }

  m.origin = {x: sFrame.x + mX + offset.x, y: sFrame.y + mY + offset.y};
  m.show();
}

// Adjust window size

function toLeft(fillCols, maxCols) {
  var win = Window.focused();
  var frame = win.frame();
  var screenFrame = win.screen().visibleFrameInRectangle();
  frame.y = screenFrame.y;
  frame.x = screenFrame.x;
  frame.height = screenFrame.height;
  frame.width = screenFrame.width * (fillCols / maxCols);
  win.setFrame(frame);
}

function toRight(fillCols, maxCols) {
  var win = Window.focused();
  var frame = win.frame();
  var screenFrame = win.screen().visibleFrameInRectangle();
  frame.y = screenFrame.y;
  frame.x = screenFrame.x + screenFrame.width * (fillCols / maxCols);
  frame.height = screenFrame.height;
  frame.width = screenFrame.width * (1 - fillCols / maxCols);
  win.setFrame(frame);
}

function fullScreen() {
  var win = Window.focused();
  var screenFrame = Window.focused().screen().visibleFrameInRectangle();
  win.setFrame(screenFrame);
}

function nearRightEdge() {
  var win = Window.focused();
  var frame = win.frame();
  var screenFrame = win.screen().visibleFrameInRectangle();
  return (frame.x + frame.width + 15) >= screenFrame.width;
}

function shrinkRight() {
  var win = Window.focused();
  var frame = win.frame();
  var screenFrame = win.screen().visibleFrameInRectangle();
  var quarterScreen = (screenFrame.width / 4.0);
  if (frame.width > quarterScreen) {
    frame.width = frame.width - quarterScreen;
    win.setFrame(frame);
  }
}

function expandRight() {
  var win = Window.focused();
  var frame = win.frame();
  var screenFrame = win.screen().visibleFrameInRectangle();
  var quarterScreen = (screenFrame.width / 4.0);
  if (!nearRightEdge()) {
    frame.width = frame.width + quarterScreen;
    win.setFrame(frame);
  }
}

function fullHeight() {
  var win = Window.focused();
  var frame = win.frame();
  var screenFrame = Window.focused().screen().visibleFrameInRectangle();
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
  var oldScreenRect = win.screen().visibleFrameInRectangle();
  var newScreenRect = screen.visibleFrameInRectangle();

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
  var win = Window.focused();
  var currentScreen = win.screen();
  var screens = [currentScreen];
  for (var x = currentScreen.previous(); x != win.screen(); x = x.previous()) {
    screens.push(x);
  }

  screens = _(screens).sortBy(function(s) { return s.visibleFrameInRectangle().x; });
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
  return _(this.all()).filter( function( app ) {
    if (app.name() === title) {
      return true;
    }
  });
};


App.focusOrStart = function ( title ) {
  var apps = App.allWithTitle( title );
  if (_.isEmpty(apps)) {
    Phoenix.notify(rageOfDongers + " Starting " + title);
    App.launch(title)
    return;
  }

  var windows = _.chain(apps)
    .map(function(x) { return x.windows(); })
    .flatten()
    .value();

  activeWindows = _(windows).reject(function(win) { return win.isMinimized();});
  if (_.isEmpty(activeWindows)) {
    showCenteredModal(whyLook + " All windows minimized for " + title);
    App.launch(title)
    return;
  }

  activeWindows.forEach(function(win) {
    win.focus();
  });
};

var mash = ['alt', 'ctrl'];
var leftOneMonitorHandler = new Key('left', mash, leftOneMonitor);
var rightOneMonitorHandler = new Key('right', mash, rightOneMonitor);

var mash = ['alt', 'cmd', 'ctrl'];
var shrinkRightHandler = new Key('left', mash, shrinkRight);
var expandRightHandler = new Key('right', mash, expandRight);

var altCmd = ['alt', 'cmd'];
var toLeftHandler = new Key('left', altCmd, function() { toLeft(1, 2);});
var toRightHandler = new Key('right', altCmd, function() { toRight(1, 2);});
var fullHeightHandler = new Key('down', altCmd, fullHeight);
var fullScreenHandler = new Key('f', altCmd, fullScreen);


var cmdCtrl = ['ctrl', 'cmd'];
var iTermHander = new Key('t', cmdCtrl, function() {App.focusOrStart('iTerm');});
//new Key('e', cmdCtrl, function() {App.focusOrStart('Emacs');});
//new Key('b', cmdCtrl , function() {App.focusOrStart('Google Chrome');});
var showZoomHandler = new Key('m', cmdCtrl , function() {App.focusOrStart('Slack');});
//new Key('x', cmdCtrl , function() {App.focusOrStart('Xcode');});
//new Key('p', cmdCtrl , function() {App.focusOrStart('Path Finder');});
//new Key('z', cmdCtrl , function() {App.focusOrStart('Zoom.us');});
//new Key('c', cmdCtrl , function() {App.focusOrStart('Fantastical 2');});
//new Key('b', cmdCtrl , function() {App.focusOrStart('Mailbox (Beta)');});
//new Key('f', cmdCtrl , function() {App.focusOrStart('Safari');});

showCenteredModal("Phoenix Config Reloaded");
