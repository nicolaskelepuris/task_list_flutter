abstract class RegisterController<T> {
  Future<List<T>> getResources();

  void openRegisterScreen();

  void closeRegisterScreen();

  void saveItem();

  Future<void> deleteItem();

  void openEditScreen(T item);

  void clearForm();

  void discardEditChanges();

  bool get validateRequiredFields;
}