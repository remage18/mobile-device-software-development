class Application {
  String name;
  static Application app = Application.name('');

  Application.name(this.name);

  factory Application(String name) {
    if (app.name == '') {
      app = Application.name(name);
      print('Application $name is running');
    } else {
      print('A new tab opened in the ${app.name} application');
    }
    return app;
  }

  void info() {
    print('Application $name');
  }
}
