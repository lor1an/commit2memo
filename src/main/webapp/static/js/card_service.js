'use strict';

App.factory('CardService', [
		'$http',
		'$q',
		function($http, $q) {

			return {

				fetchWord : function() {
					return $http.get(
							'http://localhost:10080/commit2memo/entryList/'
									+ word).then(function(response) {
						return response.data;
					}, function(errResponse) {
						console.error('Error while fetching users');
						return $q.reject(errResponse);
					});
				}
			};

		} ]);