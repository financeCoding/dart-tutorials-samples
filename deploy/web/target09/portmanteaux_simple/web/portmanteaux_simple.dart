import 'dart:html';
import 'dart:json' as json;
import 'dart:async';

var wordList;

void main() {
  query('#getWords').onClick.listen(makeRequest);
  wordList = query('#wordList');
}

void makeRequest(Event e) {
  var path = 'portmanteaux_simple.json';
  HttpRequest.getString(path)
  .then(processString)
  .catchError(handleError);
}

processString(String jsonString) {
  List<String> portmanteaux = json.parse(jsonString);
  for (int i = 0; i < portmanteaux.length; i++) {
    wordList.children.add(new LIElement()..text = portmanteaux[i]);
  }
}

handleError(AsyncError error) {
  wordList.children.add(new LIElement()..text = 'Request failed.');
}