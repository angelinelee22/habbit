
# San Jose State University 
## Senior Project for CMPE/SE 195A/B (Spring 2022)
## Group Members: Lenexa Gonsalves, Angeline Lee, Dhirtitapa Ray, and Karthika Thiruvallur 

## Link: https://github.com/angelinelee22/habbit

### Introduction:
  Within the rapidly changing, post-COVID world, students struggled to achieve the same sense of normalcy and routine they fell into before the     pandemic. Day after day, they were inundated with new, incomprehensible information regarding the effect of the virus on their lives and the state of the world around them. As a result of this seemingly never-ending uncertainty, their school work, outside hobbies, mental, and physical health all suffered. 

A habit tracker was crucial for everyone trying to follow a process to achieve their best, especially for college students as they were transitioning into a new world, living with the COVID pandemic in the background. With their world being impacted by the COVID-19 pandemic, previous and newly developed habits had been on the decline. According to a study done by the National Center for Biotechnology Information about the impact of COVID-19 on student experiences, 50% mentioned that there was a decrease in study hours and academic performance (Aucejo, French, Ugalde Araya, & Zafar, 2020).  Not being motivated enough to build positive habits was a problem many people faced trying to effectively navigate in this society.

Our project focused on the betterment of student habits and health. Our application provided a platform for busy, overworked students to keep track of their daily habits and to-do lists to earn points for their virtual avatar. Students were able to consistently complete positive habits and routines. As a result, students experienced heightened levels of mindfulness, energy, and improved overall well being. 

### Methodology: 
  #### Architecture Design
<img src=/Images/ArchitectureDesign.png width="500" height="400">

#### System Design
<img src=/Images/SystemDesign.png width="800" height="300">

#### Component Diagram
<img src=/Images/ComponentDiagram.png width="600" height="500">

#### Tools Used 
<img src=/Images/Tools.png width="400" height="100">
Firebase is Google’s application development software, in which Habbit utilized its user authentication and Firestore database features. 
Flutter is used to create the user interface design for the mobile application. Flutter widgets are used in Habbit to build the screens and specific features for Habbit. 
Flutter is run by the use of Dart, which is a programming language used to function Flutter applications. 

## Steps to Run the Project 
 * Dowload Flutter 
 * Go to the Flutter Folder 
 * Install the Path to machine 
   * export PATH = "$PATH:'pwd'/flutter/bin"
   * echo $PATH 
   * which flutter
   * flutter doctor 
* Launch our Project
   * flutter emulators 
   * flutter emulators --launch [device_name]
   * flutter run 

## Project Images
![Creating a new Account](/Images/AccountCreate.png)
![Login](/Images/Login-2.png)
![Creating a new Topic button](/Images/TopicHome-2.png)
![Creating a new Topic](/Images/Topic.png)
![Home Page](/Images/Home-2.png)
![Creating a Task](/Images/Task-2.png)


### Application Features:
#### Account Creation
Users can create accounts with their email and password which are stored in the database in realtime.
#### Login/Logout 
User's account information is being stored in the database, so it can be authenticated when logging in.      
#### Add Task Category
User can create a list for their specified topic and delete that list if needed.
#### Add Individual Tasks 
User can add to the list, delete from the list, and check/uncheck items. The lists are saved to the user’s account. 	

### Testing and Experiment:
#### Consumer-Facing Testing
With this type of testing, we test the application in terms of how useful it is for a user. With this testing strategy, we test the application by taking up a user's persona. We tested all the parts of the application - account creation, login, to-do list, points system, 
#### Functional Testing
With this type of testing strategy, we evaluated each feature with our software requirements (nonfunctional and functional). We tested all of the features: account creation, login, to-do list.   
#### Performance Testing 
Through this testing, we evaluated the responsiveness of our application. The testing measured how fast they responded to a particular action.
#### Compatability(for different services)
Through this type of testing strategy, we tested all the non-functional types of software testing. Through this, we tested the edge points of performance, reliability as well as usability. 	

### Built With: 
 - Firebase - Google’s application development software, in which Habbit utilized its user authentication and Firestore database features.
 - Flutter - Flutter is used to create the user interface design for the mobile application. Flutter widgets are used in habbit to build the screens and specific features for Habbit, such as the account creation and login features, list component, interactive button elements, and all other UI components present in the application. 
 - Dart - Flutter is run by the use of Dart, which is a programming language used to function Flutter applications. 


### Conclusion & Future Work

Overall, the development of the Habbit application is proof of the effectiveness of the software development lifecycle. The team addressed the unspoken requirements of the user base, defining the necessary features and capabilities of the app. Once the team did user research, we were able to closely specify the direction of development. After requirements were defined, the team began to design the software system and architecture according to design principles. Iterative cycles of implementation and testing ensured the application would be of the highest quality. The team agilely moved in accordance to user response to features that were added or modified. In addition to creating a robust mobile app, the team also spent two semesters honing our presentation, documentation, time management, and teamwork skills. It was vital that we manage our workload and time over the semesters, especially one where remote work was mandated. The team worked extremely fluidly together, dividing up work at weekly checkpoint meetings and managing time efficiently throughout the semester. The result is a beautiful, interactive to-do list application that meets users needs. This concludes the report documenting the software development cycle of the Habbit application.

## References
[1] Aucejo, E. M., French, J., Ugalde Araya, M. P., & Zafar, B. (2020, August 27). The impact of COVID-19 on student experiences and expectations: Evidence from a survey. Retrieved from https://www.ncbi.nlm.nih.gov/pmc/articles/PMC7451187/

## Ackowedgements
We would like to thank Professor Ahmed Banafa for his endless support and guidance as our advisor and educator. Prof. Banafa was a pillar of our success in application development and his contribution to our team is invaluable and Professor Wencen Wu for her fantastic teachings and guidance in our final year at San Jose State University as the senior project coordinator. We would also like to thank all of our past instructors, friends, and families who poured endless love and support to help us make it this far in our academic career.
