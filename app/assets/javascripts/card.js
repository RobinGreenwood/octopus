angular.module('octopusApp', [])
  .controller('CardController', ['$scope', '$http', function($scope, $http) {
    $http.get('/profile.json').then(function(response) {
      $scope.saved = false;
      $scope.cards = response.data.current_user.cards;
      $scope.user_id = response.data.current_user.user_id;
    });
    $scope.cards = []
    $scope.number = 'Card Number';
    $scope.cvv = "CVV";


    $scope.add = function() {
      $scope.cards.push({
        number: "",
        cvv: "",
        user_id: ""
      });
    };
    $scope.add();


    $scope.submit = function() {
      $http.post(
        '/cards',
        {
          number: $scope.number,
          cvv: $scope.cvv,
          user_id: $scope.user_id
        }
      ).error(function(data, status) {
        sweetAlert("Oops...", "Error saving cart. Please try again later.", "error");
      }).success(function(data, status) {
        $scope.saved = true;
      });
    };


    $scope.saveEdit =function(){
      $http.put(
        '/cards',
        {
          number: $scope.c.number,
          cvv: $scope.c.cvv
        }
      ).error(function(data, status) {
        sweetAlert("Oops...", "Error saving cart. Please try again later.", "error");
      }).success(function(data, status) {
        $scope.saved = true;
      });
    }
  }]);
