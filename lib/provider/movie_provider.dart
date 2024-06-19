// import 'package:flutter/material.dart';


// class MovieProvider extends ChangeNotifier {
//   List<MovieListModel> movieList = [];
//   List<MovieList> searchMovieModel = [];
//   var loading = DataLoad.done;
//   var loadingSearch = DataLoad.done;

//   bool isSearch = false;
//   String valueSearch = "";
//   bool enablePullUp = true;
//   int currentPage = 1;
//   int pageSize = 10;

//   MovieProvider() {
//     getMovie(reset: true);
//   }

//   void getMovie({bool reset = false}) async {
//     if (reset) {
//       currentPage = 1;
//       movieList.clear();
//       enablePullUp = true;
//       notifyListeners();
//     }
//     if (currentPage == 1) {
//       loading = DataLoad.loading;
//       notifyListeners();
//     }
//     notifyListeners();
//     try {
//       var data = await ApiServices.api(
//         type: APIMethod.get,
//         endpoint: APiEndpoint.movie,
//         param: "?page=${currentPage.toString()}",
//       );
//       if (data['results'] != null) {
//         currentPage += 1;
//         var dataList = data['results'] as List;
//         if (dataList.isEmpty) {
//           enablePullUp = false;
//         }
//         List<MovieList> list =
//             dataList.map((e) => MovieList.fromJson(e)).toList();
//         movieList.addAll(list);
//         loading = DataLoad.done;
//         notifyListeners();
//       } else {
//         loading = DataLoad.failed;
//       }
//       notifyListeners();
//     } catch (e) {
//       enablePullUp = false;
//       loading = DataLoad.failed;
//       notifyListeners();
//     }
//     notifyListeners();
//   }

//   void searchMo() async {
//     loadingSearch = DataLoad.loading;
//     notifyListeners();
//     try {
//       var data = await ApiServices.api(
//         type: APIMethod.get,
//         endpoint: APiEndpoint.search,
//         param: "?query=${valueSearch}",
//       );
//       if (data['results'] != null) {
//         var dataList = data['results'] as List;
//         List<MovieList> list =
//             dataList.map((e) => MovieList.fromJson(e)).toList();
//         searchMovieModel = list;
//         loadingSearch = DataLoad.done;
//       } else {
//         loadingSearch = DataLoad.failed;
//       }
//       notifyListeners();
//     } catch (e) {
//       loadingSearch = DataLoad.failed;
//       notifyListeners();
//     }
//   }
// }
