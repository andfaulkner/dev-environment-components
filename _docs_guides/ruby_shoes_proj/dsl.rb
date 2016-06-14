my_shoes = Shoes::App.new(title: "test_shoes_dsl") {
  instance_eval { File.read() }
}
