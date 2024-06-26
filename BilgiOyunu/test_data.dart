import 'package:bilgioyunu/main.dart';

class Testdata {
  int _index = 0;

  List<Question> _BankOfQuestions = [
    Question(
        question: 'Everest Dağı, dünyanın en yüksek dağıdır', answer: true),
    Question(question: 'Avustralya\'nın başkenti Sydney\'dir', answer: false),
    Question(
        question: 'Dünya\'nın çevresi yaklaşık 40,075 kilometredir',
        answer: true),
    Question(
        question:
            'Albert Einstein, izafiyet teorisini geliştiren bilim insanıdır',
        answer: true),
    Question(
        question: 'Venüs, Güneş Sistemi\'ndeki en sıcak gezegendir',
        answer: true),
    Question(
        question:
            'Hindistan, Çin\'den sonra dünyanın en kalabalık ikinci ülkesidir',
        answer: true),
    Question(
        question: 'Titanic, 1912 yılında ilk yolculuğunda battı', answer: true),
    Question(
        question: 'Wright kardeşler, ilk başarılı uçağı icat ettiler',
        answer: true),
    Question(
        question: 'Mona Lisa tablosu, Vincent van Gogh tarafından yapılmıştır',
        answer: false),
    Question(
        question:
            'Roma İmparatorluğu, Batı Roma İmparatorluğu\'nun düşüşüyle MS 476\'da sona erdi',
        answer: true),
    Question(question: 'Nil Nehri, Afrika\'nın en uzun nehridir', answer: true),
    Question(question: 'Küba\'nın başkenti Lima\'dır', answer: false),
    Question(
        question: 'İnsan vücudunda en büyük organ, cilt (deri) organıdır',
        answer: true),
    Question(question: 'Dünya\'nın tek doğal uydusu Mars\'tır', answer: false),
    Question(question: 'Japonya, Asya kıtasında yer alır', answer: true),
    Question(
        question: 'Christopher Columbus, Amerika\'yı keşfeden ilk Avrupalıdır',
        answer: false),
    Question(
        question: 'Amazon Yağmur Ormanları, Güney Amerika\'da yer alır',
        answer: true),
    Question(
        question: 'Demir, periyodik tabloda \'Fe\' sembolü ile gösterilir',
        answer: true),
    Question(
        question: 'En küçük atom numarasına sahip element, helyumdur',
        answer: false),
    Question(
        question: 'Louvre Müzesi, Londra\'da bulunmaktadır', answer: false),
  ];
  String getQuestionText() {
    return _BankOfQuestions[_index].question!;
  }

  bool getQuestionAnswer() {
    return _BankOfQuestions[_index].answer!;
  }

  void NextQuestion() {
    if (_index + 1 < _BankOfQuestions.length) {
      _index++;
    }
  }

  bool? isFinished() {
    if (_index + 1 == _BankOfQuestions.length) {
      return true;
    }
  }

  void reset() {
    _index = 0;
  }
}
