# task

- I understood that messages are received in .json files.

- Because each message can be divided into three parts: text, tags and words, I created a class that holds it.

- There are also methods in the class that contain processing rules and allow you to complete the array of words or tags

- The program first parses the .json files to the class, and then processes the messages according to (as at the moment two) rules and writes the corrected version to the original file.

- We can enter many .json files into the program at the same time. We give them, separated by spaces, after the program name.

- Adding new rules can be done by adding them as methods in the class and respectively one line in the main program.
