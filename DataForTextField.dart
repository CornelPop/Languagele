class LanguageService {
  static final List<String> languages = [
    'English',
    'Spanish',
    'French',
    'Italian',
    'Russian',
    'Romanian',
    'Portuguese',
    'Dutch',
    'German',
    'Swedish',
    'Albanian',
    'Catalan',
    'Polish',
    'Czech',
    'Turkish',
    'Finnish',
    'Norwegian',
    'Danish',
    'Greek',
    'Korean',
    'Japanese',
    'Chinese',
    'Mandarin',
    'Indonesian',
    'Bulgarian',
    'Hindi',
    'Bengali',
    'Hungarian',
    'Arabic',
    'Estonian',
  ];

  static List<String> getSuggestions(String query) {
    List<String> matches = [];
    matches.addAll(languages);
    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
}