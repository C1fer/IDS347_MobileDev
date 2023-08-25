class Question{
  String question;
  bool answer;

  Question({required this.question, required this.answer});

  static List<Question> questions = [
    Question(question: "The first televised presidential debate was between Jimmy Carter and Gerald Ford.", answer: false),
    Question(question: "In World War II, Hawker Typhoons served in the Pacific theater.", answer: false),
    Question(question: "The M41 Walker Bulldog remains in service in some countries to this day.", answer: true),
    Question(question: "Assyrian king Sennacherib&#039;s destruction of Babylon in 689 BCE was viewed as a triumph by other Assyrian citizens.", answer: false),
    Question(question: "¨I disapprove of what you say, but I will defend to the death your right to say it¨ is a quote from French philosopher Voltaire.", answer: false),
    Question(question: "In 1967, a magazine published a story about extracting hallucinogenic chemicals from bananas to raise moral questions about banning drugs.", answer: true),
    Question(question: "Martin Luther King Jr. and Anne Frank were born the same year. ", answer: true),
    Question(question: "Oxford University is older than the Aztec Empire. ", answer: true),
    Question(question: "The Korean War ended in 1953 without any ceasefire.", answer: false),
    Question(question: "Sir Issac Newton served as a Member of Parliament, but the only recorded time he spoke was to complain about a draft in the chambers.", answer: true),

  ];

}