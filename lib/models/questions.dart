import 'package:quiz_flutter/models/question_model.dart';

List<QuestionModel> questions = [
  QuestionModel(
    1,
    "What are the five Oceans in the world?",
    {
      "Pacific Ocean, Atlantic Ocean, Indian Ocean, Southern Ocean, Arctic Ocean":
          true,
      "Bar Beach": false,
      "All of the above": false,
    },
  ),
  QuestionModel(
    1,
    "What is the full meaning of UNICEF?",
    {
      "United Nation Independence Children Emergence Fund": false,
      "United Nations International Children's Emergency Fund": true,
      "United Nations Independence Children's Emergency Fund": false,
    },
  ),
  QuestionModel(
    1,
    "What is centenary_______?",
    {
      "1000 years": false,
      "100 years": true,
      "10 years": false,
    },
  ),
  QuestionModel(
    1,
    "Who is the first Nigerian president?",
    {
      "Dr Nnamdi Azikiwe": true,
      "Obafemi Awolowo": false,
      "Herbert Macaulay": false,
    },
  ),
  QuestionModel(
    2,
    "Who was the Nigerian first prime minister",
    {
      "Abubakar Tafawa Balewa": true,
      "Obafemi Awolowo": false,
      "Nnamdi Azikiwe": false,
    },
  ),
 ];///