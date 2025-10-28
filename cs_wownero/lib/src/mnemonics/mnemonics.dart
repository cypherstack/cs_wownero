import 'wownero/english14.dart';
import 'wownero/english25.dart';

List<String> getWowneroWordList(String language, {int seedWordsLength = 14}) {
  switch (language.toLowerCase()) {
    case 'english':
      switch (seedWordsLength) {
        case 25:
          return EnglishMnemonics25.words;
        default:
          return EnglishMnemonics14.words;
      }
    default:
      switch (seedWordsLength) {
        case 25:
          return EnglishMnemonics25.words;
        default:
          return EnglishMnemonics14.words;
      }
  }
}
