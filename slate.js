// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "focusCheckWidthMax" : 3000
});

// Monitors
var monLaptop = "1680x1050";
var monTbolt = "2560x1440";
//var monHP = "1920x1080";

// Operations
var lapMain = S.op("corner", {
  "screen" : monLaptop,
  "direction" : "top-right",
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var tboltMain = S.op("corner", {
  "screen" : monTbolt,
  "direction" : "top-right",
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var fullscreen = slate.operation("move", {
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var tboltFull = S.op("move", {
  "screen" : monTbolt,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var tboltCenter = S.op("move", {
  "screen" : monTbolt,
  "x" : "(screenSizeX-windowSizeX)/2",
  "y" : "(screenSizeY-windowSizeY)/2",
  "width" : "screenSizeX/2+screenSizeX/6",
  "height" : "screenSizeY/2+screenSizeY/6"
});

//var tboltFull = tboltMain.dup({});
var tboltTop = tboltFull.dup({ "height" : "screenSizeY/2" });
var tboltTopLeft = tboltTop.dup({ "width" : "screenSizeX/2" });
var tboltTopRight = tboltTopLeft.dup({ "x" : "screenOriginX+screenSizeX/2" });
var tboltBottom = tboltTop.dup({ "y" : "screenOriginY+screenSizeY/2" });
var tboltBottomLeft = tboltBottom.dup({ "width" : "screenSizeX/3" });
var tboltBottomMid = tboltBottomLeft.dup({ "x" : "screenOriginX+screenSizeX/3" });
var tboltBottomRight = tboltBottomLeft.dup({ "x" : "screenOriginX+2*screenSizeX/3" });
var tboltLeft = tboltTopLeft.dup({ "height" : "screenSizeY" });
var tboltRight = tboltTopRight.dup({ "height" : "screenSizeY" });
//var hpTopLeft = tboltTopLeft.dup({ "screen" : monHP });
//var hpBottomLeft = hpTopLeft.dup({ "y" : "screenOriginY+screenSizeY/2" });
//var hpRight = tboltRight.dup({ "screen" : monHP });

// common layout hashes
var lapMainHash = {
  "operations" : [lapMain],
  "ignore-fail" : true,
  "repeat" : true
};

// 1 monitor layout
var oneMonitorLayout = S.lay("oneMonitor", {
  "iTerm" : lapMainHash,
  "Google Chrome" : lapMainHash,
  "Xcode" : lapMainHash,
  "Firefox" : lapMainHash,
  "Safari" : lapMainHash
});

// Defaults
S.def([monLaptop], oneMonitorLayout);

// Layout Operations
var oneMonitor = S.op("layout", { "name" : oneMonitorLayout });
var universalLayout = function() {
  // Should probably make sure the resolutions match but w/e
  S.log("SCREEN COUNT: "+S.screenCount());
  oneMonitor.run();
};

// Batch bind everything. Less typing.
S.bnda({
  // Layout Bindings
  //"padEnter:ctrl" : universalLayout,
  //"space:ctrl" : universalLayout,

  // Basic Location Bindings
  //"pad0:ctrl" : lapChat,
  "0:ctrl;alt;cmd" : tboltCenter,
  "pad.:ctrl" : lapMain,
  //"]:ctrl" : lapMain,
  "1:ctrl;alt;cmd" : tboltBottomLeft,
  "2:ctrl;alt;cmd" : tboltBottomMid,
  "3:ctrl;alt;cmd" : tboltBottomRight,
  "4:ctrl;alt;cmd" : tboltLeft,
  "5:ctrl;alt;cmd" : tboltFull,
  "6:ctrl;alt;cmd" : tboltRight,
  "7:ctrl;alt;cmd" : tboltTopLeft,
  "8:ctrl;alt;cmd" : tboltTop,
  "9:ctrl;alt;cmd" : tboltTopRight,
  "=:ctrl;alt;cmd" : tboltTop,
  //"pad/:ctrl" : tboltBottom,
  //"pad*:ctrl" : hpBottomLeft,
  //"pad-:ctrl" : hpTopLeft,
  //"pad+:ctrl" : hpRight,

  // Resize Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "return:shift;alt;cmd" : lapMain,
  //"return:ctrl;shift;alt" : tboltMain,
  "f:alt;cmd" : fullscreen,
  "right:ctrl;alt;cmd" : S.op("resize", { "width" : "+5%", "height" : "+0" }),
  "left:ctrl;alt;cmd" : S.op("resize", { "width" : "-5%", "height" : "+0" }),
  "up:ctrl;alt;cmd" : S.op("resize", { "width" : "+0", "height" : "-5%" }),
  "down:ctrl;alt;cmd" : S.op("resize", { "width" : "+0", "height" : "+5%" }),
  "right:alt;cmd" : S.op("resize", { "width" : "-5%", "height" : "+0", "anchor" : "bottom-right" }),
  "left:alt;cmd" : S.op("resize", { "width" : "+5%", "height" : "+0", "anchor" : "bottom-right" }),
  "up:alt;cmd" : S.op("resize", { "width" : "+0", "height" : "+5%", "anchor" : "bottom-right" }),
  "down:alt;cmd" : S.op("resize", { "width" : "+0", "height" : "-5%", "anchor" : "bottom-right" }),

  // Push Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "right:ctrl;shift" : S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/3" }),
  "left:ctrl;shift" : S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/3" }),
  "up:ctrl;shift" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" }),
  "down:ctrl;shift" : S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" }),

  // Nudge Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  //"right:ctrl;alt" : S.op("nudge", { "x" : "+5%", "y" : "+0" }),
  //"left:ctrl;alt" : S.op("nudge", { "x" : "-5%", "y" : "+0" }),
  //"up:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "-5%" }),
  //"down:ctrl;alt" : S.op("nudge", { "x" : "+0", "y" : "+5%" }),

  // Throw Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  //"pad1:ctrl;alt" : S.op("throw", { "screen" : "2", "width" : "screenSizeX", "height" : "screenSizeY" }),
  //"pad2:ctrl;alt" : S.op("throw", { "screen" : "1", "width" : "screenSizeX", "height" : "screenSizeY" }),
  //"pad3:ctrl;alt" : S.op("throw", { "screen" : "0", "width" : "screenSizeX", "height" : "screenSizeY" }),
  //"right:ctrl;alt;cmd" : S.op("throw", { "screen" : "right", "width" : "screenSizeX", "height" : "screenSizeY" }),
  //"left:ctrl;alt;cmd" : S.op("throw", { "screen" : "left", "width" : "screenSizeX", "height" : "screenSizeY" }),
  //"up:ctrl;alt;cmd" : S.op("throw", { "screen" : "up", "width" : "screenSizeX", "height" : "screenSizeY" }),
  //"down:ctrl;alt;cmd" : S.op("throw", { "screen" : "down", "width" : "screenSizeX", "height" : "screenSizeY" }),
  "t:ctrl;alt;cmd" : S.op("throw", { "screen" : monTbolt }),
  "l:ctrl;alt;cmd" : S.op("throw", { "screen" : monLaptop }),

  // Focus Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  //"l:cmd" : S.op("focus", { "direction" : "right" }),
  //"h:cmd" : S.op("focus", { "direction" : "left" }),
  //"k:cmd" : S.op("focus", { "direction" : "up" }),
  //"j:cmd" : S.op("focus", { "direction" : "down" }),
  //"k:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  //"j:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  //"right:cmd" : S.op("focus", { "direction" : "right" }),
  //"left:cmd" : S.op("focus", { "direction" : "left" }),
  //"up:cmd" : S.op("focus", { "direction" : "up" }),
  //"down:cmd" : S.op("focus", { "direction" : "down" }),
  //"up:cmd;alt" : S.op("focus", { "direction" : "behind" }),
  //"down:cmd;alt" : S.op("focus", { "direction" : "behind" }),

  // Window Hints
  "esc:cmd" : S.op("hint"),

  // Switch currently doesn't work well so I'm commenting it out until I fix it.
  //"tab:cmd" : S.op("switch"),

  // Grid
  "esc:ctrl" : S.op("grid")
});

// Test Cases
S.src(".slate.test", true);
S.src(".slate.test.js", true);

// Log that we're done configuring
S.log("[SLATE] -------------- Finished Loading Config --------------");
