angular.module('octopusApp', [])
  .controller('CardController', ['$scope', '$http', function($scope, $http) {
    $http.get('/profile.json').then(function(response) {
      $scope.cards = response.data.current_user.cards;
      $scope.user_id = response.data.current_user.user_id;

    });
      $scope.cards = []
      $scope.number = 'Card Number';
      $scope.cvv = "CVV";

      console.log("here:::::: " + $scope.cards);

      $scope.submit = function() {
        $scope.cards.push({
          number: "",
          cvv: "",
          user_id: ""
        });

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

  }]);







