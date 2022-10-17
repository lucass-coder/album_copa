abstract class StickerDetailView {
  void screenLoaded(
    bool hasSticker,
    String countryCode,
    String stickerName,
    String countryName,
    int amount,
  );

  void updateAmount(int i);

  void showLoader();

  void saveSuccess();

  void error(String s) {}
}
