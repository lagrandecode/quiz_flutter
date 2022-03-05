class Questions {
 final int? id, answer;
 final String? question;
 final List<String>? options;

 Questions({this.id, this.answer, this.options, this.question});
}

const List sample_data = [
  {
    "id": 1,
    "question":
    "What are the five Oceans in the world?",
    "options": ['Pacific Ocean, Atlantic Ocean, Indian Ocean, Southern Ocean, Arctic Ocean', 'Bar Beach', 'All of the Above',],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question": "When google release Flutter.",
    "options": ['Jun 2017', 'Jun 2017', 'May 2017', 'May 2018'],
    "answer_index": 2,
  },
  {
    "id": 3,
    "question": "A memory location that holds a single letter or number.",
    "options": ['Double', 'Int', 'Char', 'Word'],
    "answer_index": 2,
  },
  {
    "id": 4,
    "question": "What command do you use to output data to the screen?",
    "options": ['Cin', 'Count>>', 'Cout', 'Output>>'],
    "answer_index": 2,
  },
];