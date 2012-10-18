'use strict';

/* Controllers */

// var TweetListCtrl = ['$scope', '$http', function($scope, $http){
// 	$http.get('tweets.json').success(function(data) {
//   $scope.tweets = data.statuses;
//   $scope.orderProp = 'age';
// 	}
// }];

// controllers.controller ('MainCntl', ['$scope', '$route', '$routeParams', '$location', function($scope, $route, $routeParams, $location){

//   $scope.$route = $route;
//   $scope.$location = $location;
//   $scope.$routeParams = $routeParams;

// }]);

controllers.controller('TwitterCntl', ['$scope', '$routeParams', 'Twitter', 'User', function($scope, $routeParams, Twitter, User){
	
  $scope.name = "TwitterCntl";
  $scope.params = $routeParams
  $scope.user = User.get();
  $scope.tweets = Twitter.get({
      search:$scope.params.hash
      },
      function(data){ // success
        $scope.tweets = data
      },
      function(data){
        // error handling goes here
      }
    );
  $scope.mostRecent = User.query('last_viewed');

  $scope.searchHash = function() {
    $scope.tweets = Twitter.get({search:$scope.hash});
  };

  $scope.getHash = function() {
    $scope.tweets = Twitter.get({search:$scope.params.hash})
  }

}]);

controllers.controller('UserCntl', ['$scope', '$routeParams', 'User', function($scope, $routeParams, User){
	
  $scope.user = User.get();
  $scope.params = $routeParams;
  $scope.mostRecent = User.query('last_viewed');
  $scope.search_param = "railsrumble"

  $scope.getHash = function() {
    $scope.tweets = Twitter.get({search:$scope.params.hash})
  };

  $scope.updateTweets = function(hash) {
    console.log(hash);
    $scope.search_param = hash;
    browser().navigateTo('#/hash/' + hash);
  };

}]);

  // // Hashtag Submit Form
  // $scope.hashtaglist = [];
  // $scope.hash = '';
  //   $scope.submit = function() {
  //   if (this.hash) {
  //     this.hashtaglist.push(this.hash);
  //     this.hash = '';
  //   }
  // };

// controllers.controller('UserCtrl', ['$scope', 'User', function($scope, User){

// 	$scope.user = User.get();
// 	$scope.mostRecent = 'date:"EEE MMM d h:mm:ss Z yyyy"';

// }]);



//PhoneListCtrl.$inject = ['$scope', 'Phone'];



// function TweetDetailCtrl($scope, $routeParams, Phone) {
//   $scope.phone = Phone.get({phoneId: $routeParams.phoneId}, function(phone) {
//     $scope.mainImageUrl = phone.images[0];
//   });

//   $scope.setImage = function(imageUrl) {
//     $scope.mainImageUrl = imageUrl;
//   }
// }

//PhoneDetailCtrl.$inject = ['$scope', '$routeParams', 'Phone'];
