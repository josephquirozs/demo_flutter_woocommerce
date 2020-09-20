class HtmlTagRemover {
  static String removeElement(String text, String element) {
    return text.replaceAll(
      new RegExp('<$element>|</$element>'),
      '',
    );
  }
}
