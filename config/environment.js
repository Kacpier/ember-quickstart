"use strict";

module.exports = function (environment) {
  const ENV = {
    modulePrefix: "emberjs-webmeets",
    environment,
    rootURL: "/",
    locationType: "history",
    EmberENV: {
      EXTEND_PROTOTYPES: false,
    },
    APP: {},
  };

  if (environment === "test") {
    ENV.locationType = "none";
    ENV.APP.autoboot = false;
  }

  return ENV;
};
