console.log('----------------------------------------------------------------------------------');
//########################################
//#          ITERATION PROTOCOL          #
//########################################
console.log('***************** ITERATION PROTOCOL *****************');
// one of two iteration protocols. Defines 
// 

var x = 'outer scope';
(function() {
  console.log(x);
  var x = 'inner scope';
}());