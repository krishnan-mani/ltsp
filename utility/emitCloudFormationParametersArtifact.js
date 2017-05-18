var fs = require('fs');

var filename = process.argv[2];
fs.readFile(filename, 'utf8', function (err, data) {
    if (err) {
        return console.log(err);
    }

    var configuration = JSON.parse(data);
    var parameterInfo = {};

    (configuration.forEach(function (x) {
        var key = x.ParameterKey;
        var value = x.ParameterValue;
        parameterInfo[key] = value;
    }));

    var artifactJson = "{\"Parameters\":" + JSON.stringify(parameterInfo) + "}";
    console.log(artifactJson);
});
