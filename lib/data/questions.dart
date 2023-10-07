import 'package:trivia/colors/app_color.dart';

Map<String, dynamic> riddlesData = {
  "title": "Riddles",
  "currentIndex": -1,
  "currentLevel": 1,
  "data": [
    {
      "question":
          "What is there one of in every corner and two of in every room?",
      "dialog": {
        "title": "The letter 'O'",
        "content":
            "'O' appears once in the word 'corner' and twice in the word 'room'",
      },
      "options": [
        {
          "text": "Sand",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Socks",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "The letter 'O'",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Love",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "What is stronger than steel but can't handle the sun?",
      "dialog": {
        "title": "Ice",
        "content": "Ice is strong but ironically melts under the sun",
      },
      "options": [
        {
          "text": "Iron",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Ice",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Man",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Glass",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "The more there is, the less you see. What am I?",
      "dialog": {
        "title": "Darkness",
        "content": "You see less the darker it gets",
      },
      "options": [
        {
          "text": "Darkness",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Magic",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Hope",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Garri",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "I am full of holes but strong as steel. What am I?",
      "dialog": {
        "title": "A chain",
        "content": "A chain can hold up to 125,000 pounds of weight",
      },
      "options": [
        {
          "text": "A net",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Sand",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "A chain",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "A basket",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "You are my brother, but I'm not your brother. Who am I?",
      "dialog": {
        "title": "I'm your sister",
        "content": "Sometimes they're annoying, but it's great to have them.",
      },
      "options": [
        {
          "text": "My father",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "My mother",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "My brother",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "My sister",
          "value": true,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "What can fill an entire room without taking up any space?",
      "dialog": {
        "title": "Light",
        "content": "Light has no mass, neither does it occupy space",
      },
      "options": [
        {
          "text": "Air",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Dust",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Light",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Fart",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "What has 10 letters and starts with gas?",
      "dialog": {
        "title": "Automobile",
        "content": "An automobile has 10 letters and starts with gas (fuel)",
      },
      "options": [
        {
          "text": "Gasoline",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Automobile",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Gaseous",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Vehicle",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "What is it that no-one wants but no-one wants to lose?",
      "dialog": {
        "title": "Lawsuit",
        "content": "Who would want to lose a lawsuit?",
      },
      "options": [
        {
          "text": "Death",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Trouble",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "A fight",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Lawsuit",
          "value": true,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "I am an odd number. Take away a letter an I become even. "
          "What am I?",
      "dialog": {
        "title": "Seven",
        "content": "Removing 's' from 'seven' makes it 'even'",
      },
      "options": [
        {
          "text": "Three",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Five",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Seven",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Eleven",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "Who has married many women but was never married?",
      "dialog": {
        "title": "A Priest",
        "content": "A Preist never gets married",
      },
      "options": [
        {
          "text": "Solomon",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "A poor man",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "A Priest",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "A woman",
          "value": false,
          "color": .yellow,
        },
      ]
    },
  ]
};

Map<String, dynamic> animalsData = {
  "title": "Animals",
  "currentIndex": -1,
  "currentLevel": 1,
  "data": [
    {
      "question": "How many years can a snail sleep for?",
      "dialog": {
        "title": "3 years",
        "content": "Snails can sleep up to 3 years at a time",
      },
      "options": [
        {
          "text": "1",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "2",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "3",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "4",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "Which animal has no vocal cords?",
      "dialog": {
        "title": "Giraffes",
        "content":
            "While they do have a vocal box, giraffes have no vocal cords",
      },
      "options": [
        {
          "text": "Giraffes",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Rhinos",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Deer",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Beavers",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "How many eyes does a honey bee have?",
      "dialog": {
        "title": "5 eyes",
        "content": "The honey bee has 2 large compound eyes and 3 smaller eyes "
            "in the center of their head, for a total of 5 eyes",
      },
      "options": [
        {
          "text": "2",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "3",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "5",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "8",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "What is a female donkey called?",
      "dialog": {
        "title": "A Jenny",
        "content": "Female donkeys are called a jenny or jennet",
      },
      "options": [
        {
          "text": "Julie",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Jackie",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Jenny",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Judy",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "How many hearts does an octopus have?",
      "dialog": {
        "title": "3 hearts",
        "content": "An octopus has 3 hearts, one to circulate blood and two "
            "to pump it passed its gills and pick up oxygen.",
      },
      "options": [
        {
          "text": "1",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "3",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "4",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "8",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "What type of animal is a flemish giant?",
      "dialog": {
        "title": "A rabbit",
        "content":
            "The Flemish Giant is one of the largest breeds of a domestic rabbit.",
      },
      "options": [
        {
          "text": "Guinea Pig",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Duck",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Rabbit",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Horse",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "How long does it take for a sloth to digest its food?",
      "dialog": {
        "title": "Two weeks",
        "content":
            "Sloths are the mammals that take the longest to digest their meals.",
      },
      "options": [
        {
          "text": "One week",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Two weeks",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Four weeks",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Six weeks",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "How many bones does a shark have?",
      "dialog": {
        "title": "O bones!",
        "content":
            "Sharks have no bones, but have cartilaginous tissue instead.",
      },
      "options": [
        {
          "text": "0",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "6",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "20",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "150",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "What color is the beak of a mature mute swan?",
      "dialog": {
        "title": "Orange",
        "content": "Mute Swans are known for their white bodies with an orange "
            "beak that has a black base",
      },
      "options": [
        {
          "text": "Red",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "White",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Orange",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Yellow",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "Which animal has the largest eyes in the animal kingdom?",
      "dialog": {
        "title": "The Giant Squid",
        "content":
            "The ostrich is the land animal with largest eyes, with a diameter of 2 inches. "
                "But the giant squid is the animal with the largest eyes in the animal kingdom, with a diameter of 10 inches.",
      },
      "options": [
        {
          "text": "The giant squid",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Ostrich",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Chamelon",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Camel",
          "value": false,
          "color": .yellow,
        },
      ]
    },
  ]
};

Map<String, dynamic> proverbsData = {
  "title": "Proverbs",
  "currentIndex": -1,
  "currentLevel": 1,
  "data": [
    {
      "question": "Beggars can't be ___.",
      "dialog": {
        "title": "Beggars can't be choosers",
        "content":
            "People dependent on others must be content with what is offered to them",
      },
      "options": [
        {
          "text": "Rich",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Beggars for life",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Choosers",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Successful",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "A bird in the hand is worth two in the ___.",
      "dialog": {
        "title": "A bird in the hand is worth two in the bush",
        "content": "What you have is better than what you might get",
      },
      "options": [
        {
          "text": "Forest",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Bush",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Grave",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Nest",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "The grass is always ___ on the other side.",
      "dialog": {
        "title": " The grass is always greener on the other side",
        "content":
            "Other people always seem to be in a better situation, although it might not be true",
      },
      "options": [
        {
          "text": "Better",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Greener",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Bigger",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Longer",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "Every cloud has a ___ lining",
      "dialog": {
        "title": "Every cloud has a silver lining",
        "content": "There is always a positive side to any difficult situation",
      },
      "options": [
        {
          "text": "Gold",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Bronze",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Diamond",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Silver",
          "value": true,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "Out of sight, out of ___",
      "dialog": {
        "title": "Out of sight, out of mind",
        "content":
            "People or things that are no longer present are easily forgotten",
      },
      "options": [
        {
          "text": "Mind",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Thought",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Control",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "The light",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "Good things come to those who ___",
      "dialog": {
        "title": "Good things come to those who wait",
        "content": "Patience is rewarded",
      },
      "options": [
        {
          "text": "Deserve them",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Wait",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Want them",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Are good",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "A drowning man will clutch at a ___",
      "dialog": {
        "title": "A drowning man will clutch at a straw",
        "content":
            "If someone is in a difficult or tough situation, he/ she will grasp on any available opportunity",
      },
      "options": [
        {
          "text": "Straw",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Rope",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Thread",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Hand",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "Practice what you ___",
      "dialog": {
        "title": " Practice what you preach",
        "content": "Behave the way you encourage other people to behave",
      },
      "options": [
        {
          "text": "Dream",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Preach",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "See",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Feel like practicing",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": "Ignorance is ___",
      "dialog": {
        "title": "Ignorance is bliss",
        "content": "If you don’t know about something, you don’t need to bother "
            "about it. In other words, if you’re unaware of something, it won’t cause "
            "you stress.",
      },
      "options": [
        {
          "text": "Plenty",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "Bliss",
          "value": true,
          "color": .yellow,
        },
        {
          "text": "Stupidity",
          "value": false,
          "color": .yellow,
        },
        {
          "text": "A virtue",
          "value": false,
          "color": .yellow,
        },
      ]
    },
    {
      "question": " No news is ___ news",
      "dialog": {
        "title": " No news is good news",
        "content": "If you don’t receive any news about someone or something, "
            "it means that everything is fine and going normally.",
      },
      "options": [
        {
          "text": "Good",
          "value": true,
          "color": AppColor.yellow,
        },
        {
          "text": "Bad",
          "value": false,
          "color": AppColor.yellow,
        },
        {
          "text": "Wasted",
          "value": false,
          "color": AppColor.yellow,
        },
        {
          "text": "New",
          "value": false,
          "color": AppColor.yellow,
        },
      ]
    },
  ]
};
