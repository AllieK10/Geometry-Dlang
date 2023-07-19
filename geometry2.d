import std;

 class Figures
 {
    //attributes that are gonna be different for every object
    double height; 
    double width;

    this(double height, double width) //constructor called every time we create a new object
    {
        //to refer to object without actually knowing its parameters
        this.height = height;
        this.width = width;
    }

    void enterHeight() //function for getting height from user
    {
        write("Enter its height: ");
        readf("%s\n", this.height);
    }

     void enterWidth() //function for getting width from user
    {
        write("Enter its width: "); 
        readf("%s\n", this.width);
    }
 
     double countSquare() //function for counting square of any object           
    { 
      double square;
      return square;
    }
     
     void draw(char z) //function for drawing any object
    {
        writeln(""); 
    }
  }

class Rectangle : Figures //class Rectangle is inherited from class Figures
{
    this() //it has its parameters
    {
        //pass in all these into the super class and have it process everything for us
    	super(height, width);
    }

    override double countSquare() 
    {
    	double square = height*width; //formula to count square of rectangle
    	return square;
    }
    override void draw(char z) //now we have to draw a rectangle using the parameters from above
    {
        for(int i=0; i<height; i++)
        {
            for(int j=0; j<width; j++)
            {
                write(z);
            }
            writeln();
        }
    }
}

class Sq : Figures //Sq stands for "square"
{
  this()
    {
    	super(height, width);
    }

  override double countSquare()
    {
    double square = height*width; //technically we need just one parameter, S=A^2
    return square;
    }

    override void draw(char z) //height = width, but the method itself is pretty much the same
    {
        for(int i=0; i<height; i++)
        {
            for(int j=0; j<width; j++)
            {
                write(z);
            }
            writeln();
        }
    }
}

class Triangle : Figures
{
    this()
    {
   	   super(height, width); //right triangle
    }

    override double countSquare()
    {
        double square = height*width/2; //S = 0.5AH
        return square;
    }

    override void draw(char z) //this has to draw a left-alligned triangle
    {
        if (height == width) //if the triangle is isosceles, then we only need just one parameter
        {
            for(int i=0; i<height; i++)
            {
                for(int j=0; j<=i; j++)
                {
                    write(z);
                }
                writeln();
            }
        }
        else if (width < height) //if height is greater than width
        {
            for(int step = 1; step <= height; step++)//then for each step starting from 1 (not 0!) before it reaches the height
            { 
                double num = width/height*step; //counting the number of chars to print on each line
                if (num < 0.5) //so that we wouldn't get empty spaces
                {
                    write(z);
                }
                real q = round(num); //round num to get an integer, which will be the final number of chars
                for (int i = 0; i < q; i++) //to print final triangle
                {
                    write(z);
                }
                writeln();
            }
            writeln();
        }
        else if (width > height) //if width is greater than height
        {
            for(int step = to!int(height); step >= 1; step--) //backwards, because we building a horizontal triangle 
            {
                double num = width/height*step; 
                real q = round(num); //counting the number of chars to print on each line
                for (int i = 0; i < q; i++)
                {
                    write(z);
                }
                writeln();
            }
            writeln();
        }
    }
}

class Frame : Figures //frame is a rectangle without insides
{
    this()
    {
        super(height, width);
    }

    override double countSquare()
    {
        double square = height*width; //same as in rectangle
        return square;
    }

    override void draw(char z)
    {
        for(int i=0; i<width; i++) //upper border
        {
            write(z);
        }
        writeln();
        for(int i=0; i<height-2; i++) //left and right borders
        {
            for(int j=0; j<width; j++)
            {
                if (j == 0 || j == width - 1)
                {
                    write(z);
                }
                else 
                {
                    write(" ");
                }
            }
            writeln();
        }
        for(int i=0; i<width; i++) //lower border
        {
            write(z);
        }
        writeln();
    }
}


void main()
{
    Figures[] figures; 
    while(true)
    {
        string type; //type (name) of geometric figure
        write("Enter type: "); //user input
        readf("%s\n", type);
        if (type == "rectangle") //if they type in "rectangle", then:
        {
            auto rectangle = new Rectangle; //create a new object
            rectangle.enterWidth(); //call function to get width
            rectangle.enterHeight(); //same with height
            figures ~= rectangle;
        }
        else if (type == "sq")
        {
            auto sq = new Sq;
            sq.enterWidth();
            sq.enterHeight();
            figures ~= sq;
        }
        else if (type == "triangle")
        {
            auto triangle = new Triangle;
            triangle.enterWidth();
            triangle.enterHeight();
            figures ~= triangle;
        }
        else if (type == "frame")
        {
            auto frame = new Frame;
            frame.enterWidth();
            frame.enterHeight();
            figures ~= frame;
        }
        else if (type == "")
        {
            break;
        }
    }

    sort!((a,b) => a.countSquare() < b.countSquare())(figures); //sorting square values in descending order
    char z;
    write("Enter char: ");
    readf("%s\n", z);
    foreach (f; figures)
    {
        f.draw(z);
    }

}
