
var exampleArray = [2, -5, 10, 5, 4, -10, 0];

console.log(exampleArray);

function process(array) {
	var positions = [];

	array.forEach (function(a, i) {
		array.forEach (function(b, j) {
			if (a + b === 0) {
				positions.push(i + "," + j);
			}
		});

		delete array[i];
	});

	return positions;
}

var results = process(exampleArray);

console.log(results);