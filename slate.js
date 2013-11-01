// Configs
S.cfga({
  "defaultToCurrentScreen" : true,
  "secondsBetweenRepeat" : 0.1,
  "checkDefaultsOnLoad" : true,
  "nudgePercentOf" : "screenSize",
  "resizePercentOf" : "screenSize",
  "windowHintsSpread" : true,
  "windowHintsIgnoreHiddenWindows" : false,
  "windowHintsShowIcons" : true,
  "focusCheckWidthMax" : 3000
});

// Monitors
var monLaptop = "1680x1050";
var monTbolt1 = 1;
var monTbolt2 = 2;

// Operations
var lapMain = S.op("corner", {
  "screen" : monLaptop,
  "direction" : "top-right",
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var tbolt1Main = S.op("corner", {
  "screen" : monTbolt1,
  "direction" : "top-right",
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var tbolt2Main = S.op("corner", {
  "screen" : monTbolt2,
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
  "screen" : monTbolt1,
  "x" : "screenOriginX",
  "y" : "screenOriginY",
  "width" : "screenSizeX",
  "height" : "screenSizeY"
});

var tboltCenter = S.op("move", {
  "screen" : monTbolt1,
  "x" : "(screenSizeX-windowSizeX)/2",
  "y" : "(screenSizeY-windowSizeY)/2",
  "width" : "screenSizeX/2+screenSizeX/6",
  "height" : "screenSizeY/2+screenSizeY/6"
});

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


// Batch bind everything. Less typing.
S.bnda({
  // Layout Bindings

  // Basic Location Bindings
  //"pad0:ctrl" : lapChat,
  "0:ctrl;alt;cmd" : tboltCenter,
  "pad.:ctrl" : lapMain,
  //"]:ctrl" : lapMain,
  "1:1;alt;cmd" : tboltBottomLeft,
  "1:2;alt;cmd" : tboltBottomLeft.dup({ screen: monTbolt2 }),
  "1:`;alt;cmd" : tboltBottomLeft.dup({ screen: monLaptop }),
  "2:1;alt;cmd" : tboltBottomMid,
  "2:2;alt;cmd" : tboltBottomMid.dup({ screen: monTbolt2 }),
  "2:`;alt;cmd" : tboltBottomMid.dup({ screen: monLaptop }),
  "3:1;alt;cmd" : tboltBottomRight,
  "3:2;alt;cmd" : tboltBottomRight.dup({ screen: monTbolt2 }),
  "3:`;alt;cmd" : tboltBottomRight.dup({ screen: monLaptop }),
  "4:1;alt;cmd" : tboltLeft,
  "4:2;alt;cmd" : tboltLeft.dup({ screen: monTbolt2}),
  "4:`;alt;cmd" : tboltLeft.dup({ screen: monLaptop}),
  "5:1;alt;cmd" : tboltFull,
  "5:2;alt;cmd" : tbolt2Main,
  "5:`;alt;cmd" : lapMain,
  "6:1;alt;cmd" : tboltRight,
  "6:2;alt;cmd" : tboltRight.dup({ screen: monTbolt2 }),
  "6:`;alt;cmd" : tboltRight.dup({ screen: monLaptop }),
  "7:1;alt;cmd" : tboltTopLeft,
  "7:2;alt;cmd" : tboltTopLeft.dup({ screen: monTbolt2 }),
  "7:`;alt;cmd" : tboltTopLeft.dup({ screen: monLaptop }),
  "8:1;alt;cmd" : tboltTop,
  "8:2;alt;cmd" : tboltTop.dup({ screen: monTbolt2 }),
  "8:`;alt;cmd" : tboltTop.dup({ screen: monLaptop }),
  "9:1;alt;cmd" : tboltTopRight,
  "9:2;alt;cmd" : tboltTopRight.dup({ screen: monTbolt2 }),
  "9:`;alt;cmd" : tboltTopRight.dup({ screen: monLaptop }),
  "=:1;alt;cmd" : tboltTop,
  "=:2;alt;cmd" : tboltTop.dup({ screen: monTbolt2 }),
  "=:`;alt;cmd" : tboltTop.dup({ screen: monLaptop }),
  //"pad/:ctrl" : tboltBottom,
  //"pad*:ctrl" : hpBottomLeft,
  //"pad-:ctrl" : hpTopLeft,
  //"pad+:ctrl" : hpRight,

  // Resize Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  // "return:`;alt;cmd" : lapMain,
  // "return:1;alt;cmd" : tbolt1Main,
  // "return:2;alt;cmd" : tbolt2Main,
  "f:alt;cmd" : fullscreen,
  "z:alt;cmd" : S.op("undo"),

  "right:ctrl;alt;cmd" : S.op("resize", { "width" : "+5%", "height" : "+0" }),
  "left:ctrl;alt;cmd" : S.op("resize", { "width" : "-5%", "height" : "+0" }),
  "up:ctrl;alt;cmd" : S.op("resize", { "width" : "+0", "height" : "-5%" }),
  "down:ctrl;alt;cmd" : S.op("resize", { "width" : "+0", "height" : "+5%" }),
  // "right:alt;cmd" : S.op("resize", { "width" : "-5%", "height" : "+0", "anchor" : "bottom-right" }),
  // "left:alt;cmd" : S.op("resize", { "width" : "+5%", "height" : "+0", "anchor" : "bottom-right" }),
  // "up:alt;cmd" : S.op("resize", { "width" : "+0", "height" : "+5%", "anchor" : "bottom-right" }),
  // "down:alt;cmd" : S.op("resize", { "width" : "+0", "height" : "-5%", "anchor" : "bottom-right" }),

  // Push Bindings
  // NOTE: some of these may *not* work if you have not removed the expose/spaces/mission control bindings
  "right:shift;alt;cmd" : S.op("push", { "direction" : "right", "style" : "bar-resize:screenSizeX/3" }),
  "left:shift;alt;cmd" : S.op("push", { "direction" : "left", "style" : "bar-resize:screenSizeX/3" }),
  "up:shift;alt;cmd" : S.op("push", { "direction" : "up", "style" : "bar-resize:screenSizeY/2" }),
  "down:shift;alt;cmd" : S.op("push", { "direction" : "down", "style" : "bar-resize:screenSizeY/2" }),

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
  "return:`;alt;cmd" : S.op("throw", { "screen" : monLaptop, style: "resize" }),
  "return:1;alt;cmd" : S.op("throw", { "screen" : monTbolt1, style: "resize" }),
  "return:2;alt;cmd" : S.op("throw", { "screen" : monTbolt2, style: "resize" }),

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
