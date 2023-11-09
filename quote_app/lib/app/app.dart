import 'package:quote_app/services/hybirdData.dart';
import 'package:quote_app/view/favouriteView.dart';
import 'package:quote_app/view/homeViw.dart';
import 'package:quote_app/view/selected_category_quote_view.dart';
import 'package:quote_app/view/splashView.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';


@StackedApp(
  routes:[  /////define all routes and run  command
    //MaterialRoute(page: splashView,initial: true),
    MaterialRoute(page: splashView,initial: true),
    MaterialRoute(page: homeView),
    MaterialRoute(page: selected_category_quote_view),
    MaterialRoute(page: favouriteView)
    

  ],
 dependencies: [ ///define all services
    Singleton(classType: NavigationService),
    LazySingleton(classType: hibirdData)

 ])


class App {}