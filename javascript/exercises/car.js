
var Car = function(model, noise) {
	this.model = model;
	this.noise = noise;
	this.wheels = 4;
}

Car.prototype.makeNoise = function() {
	console.log(this.model + " has " + this.wheels + " wheels and makes " + this.noise);
};

var car1 = new Car('Ford', 'Brrr!');
var car2 = new Car('Ferrari', 'BRRRRRRR!!');

car1.makeNoise();
car2.makeNoise();