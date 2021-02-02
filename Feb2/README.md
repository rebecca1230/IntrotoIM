## Second Assignment: Create an art with loops 
## Process explanation 
For the second assignment, I have decided to create a telescope with a moving background, but more, this was an expriment on what I can do with Processing. 

![](/Feb2/artrecording.mov)

First, I coded for an upward moving horizontal line, like the following: 

![](/Feb2/horizontal_line_up.png)

Then, having this program written, I adjust the key parts and create the right-ward moving vertical line with the following code. 

![](/Feb2/vertical_line_right.png)

Having the above separately, I scrutinize the codes deeply to think of a way to let them work at the same time. At first, I was playing around with && to see how that works. Then, I generated the following code with help of the concept | "or". 

![](/Feb2/vertical_horizontal_together.png)

Changed the lines to rectangles, and here is the final work: 

![](/Feb2/firsttelescope.png)
![](/Feb2/secondtelescope.png)

### Difficulties
1. Because I can only have one "void draw(){" function in one programming, I will have to think of a way to merge two commands of action under the same "void draw(){" function. This makes things more difficult.
2. I notice that in programming, there are multiple ways to do the same thing. Deciding which way to execute the function depends on the situations. I found this decision process challenging. 
### Discovery: mousePressed and mouseReleased
Though at the end did not apply those functions into the programming, I discovered something worth investigate more.
I've been experimenting on the two functions and realise that the differences are subtle. I tried to use a for loop that changes the background of the art with mousePressed and mouseReleased. However, I notice that mousePressed can be inserted under a void whereas mouseReleased can not. 
### Reflection: The moment I know how to do it
In this assignment, I was trying to create an art for which a vertical line moving rightward and a horizontal line moving upward can happen at the same time. I was able to do them separately. However, I could not find a way to combine the two programs. After multiple times of experimenting without seeing an appealing result, I tried replace the sign && "and" to | "or" after checking the Reference on Processing page, it finally worked! 
This is an important moment in my journey of learning coding/Processing. 
I realized that the process of learning programming is really unique. 
It requires extreme attentiveness and constantly thinking about "what if", what if I do this instead of that, what if there is a more effective way of doing things, what if I can mix those together......etc. 
I realised that it will be really difficult to do programming without patient and the will to experiment. Understanding the terminology and the basic structure is just the step of knowing the tools and how to use them. The real part, the essence, of programming is "create". The ability to create things with programming will only be acquire from "doing", not saying, not thinking, not understanding, but "doing". Progress are most effectively made by just trying it out. This can be a daunting and frustrating process, but the moment of feeling "Oh! This works!" is pretty rewarding. Tiny mistakes makes a huge difference in programming.
