//Node.js implementation

var readline = require('readline');

var rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});


function gcd(a, b) {
    if (b === 0) {
        return a;
    } else {
        return gcd(b, a % b);
    }
}

function lcm(a, b) {
    var temp = gcd(a, b);
    return temp ? (a/temp) * b : 0;
}


var gotN = false;
var numerator = true;
var count = 0;
var n;
var fractions = [];


rl.prompt();
rl.on('line', function(line) {
    if (!gotN) {
        n = Number(line);
        gotN = true;

    // Reading Fractions
    } else {
        var fraction = {}
        var fStrings = line.split("/");
        fraction["numerator"] = Number(fStrings[0]);
        fraction["denominator"] = Number(fStrings[1]);
        fractions[count] = fraction;
        
        count++;
        if (count >= n) {
            rl.close();
        }

    } 
   
}).on('close',function(){
    var current = fractions[0];
    for (var i = 1; i < fractions.length; i++) {
        var leftDenom = current["denominator"];
        var rightDenom = fractions[i]["denominator"]
        var l = lcm(leftDenom, rightDenom);
        leftMul = l/leftDenom;
        rightMul = l/rightDenom;
        current["numerator"] = (current["numerator"] * leftMul) + (fractions[i]["numerator"] * rightMul);
        current["denominator"] = l;
    }

    //Simplify end fraction
    var g = gcd(current["numerator"], current["denominator"]);
    current["numerator"]/=g;
    current["denominator"]/=g;

    if (current["denominator"] === 1) {
        console.log(current["numerator"]);   
    } else {
        console.log(current["numerator"] + "/" + current["denominator"]); 
    } 
});
