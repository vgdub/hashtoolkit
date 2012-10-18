'use strict';


/* Services */

services.factory('Twitter',['$resource', function($resource){
  return $resource('/api/:action', {action:'get_tweets.json', search:'angularjs'}, {
  	get: {method:'GET', isArray:true},
    query: {method:'GET', isArray:true}
  });
}]);

services.factory('User',['$resource', function($resource){
  return $resource('/assets/angular/user_saved_hashtags.json', {}, {
  	get: {method:'GET'},
    query: {method:'GET', isArray:true}
  });
}]);

// services.factory('User', ['$resource', function($resource){
// 	return $resource('/assets/angular/user_saved_hashtags.json', {}, {
// 		get: {method:'GET'},
// 		query: {method:'GET', isArray:true}
// 	});
// }]);

// angular.module('phonecatServices', ['ngResource']).
//     factory('Phone', function($resource){
//   return $resource('phones/:phoneId.json', {}, {
//     query: {method:'GET', params:{phoneId:'phones'}, isArray:true}
//   });
// });
