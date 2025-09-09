module.exports = function(api) {
  api.cache(true);

  const presets = [
    ["@babel/preset-env", {
      "targets": "> 0.5%, not dead"
    }]
  ];
  const plugins = [];

  return {
    presets,
    plugins
  };
}
