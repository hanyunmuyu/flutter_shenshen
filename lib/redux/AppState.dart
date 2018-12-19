import 'UserRedux.dart';
import 'ThemeRedux.dart';
import '../model/UserModel.dart';
import '../model/ThemeModel.dart';

class AppState {
  UserModel user;
  ThemeModel themeModel;

  AppState({this.user, this.themeModel});
}

AppState appReducer(AppState state, action) {
  return AppState(
    themeModel: ThemeDataReducer(state.themeModel, action),
    user: UserReducer(state.user, action),
  );
}
