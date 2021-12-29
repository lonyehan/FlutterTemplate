import 'package:my_first_flutter_app/reducers/index.dart';
import 'package:redux_saga/redux_saga.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:redux/redux.dart';

class ConfigureStore {
  Store<dynamic>? store;
  var sagaMiddleware = createSagaMiddleware();

  ConfigureStore(initialState) {
    store = Store<dynamic>(rootReducer,
        initialState: initialState,
        middleware: [
          applyMiddleware(sagaMiddleware),
          LoggingMiddleware.printer()
        ]);
    sagaMiddleware.setStore(store as Store<dynamic>);
  }

  run(rootSaga) => {sagaMiddleware.run(rootSaga)};
}
