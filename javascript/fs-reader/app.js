
var fs = require("fs");

// Ruby version
// contents = IO.read("../../html_css/trello-clone/index.html")

fs.readFile("../../html_css/trello-clone/index.html", "utf8", function (error, contents) {
	// If error isn't null, there was a problem.
  	if (error !== null) {
    	console.log("This is the ERROR:")
    	console.log(error.message);
  	}

  	// Error is null, we are good to go.
  	else {
    	console.log(contents.length);

    	var htmlLines = contents.split("\n");

    	console.log(htmlLines);
  	}
});