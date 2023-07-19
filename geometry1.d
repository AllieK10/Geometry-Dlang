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
        readf("%.2f\n", this.height);
    }

     void enterWidth() //function for getting width from user
    {
        write("Enter its width: "); 
        readf("%.2f\n", this.width);
    }
 
     double countSquare(double height, double width) //function for counting square of any object           
    { 
      //(takes hight and width as input and returns square) 
      double square;
      return square;
    }
     
     void draw() //function for drawing any object
    {
        writeln(""); //i don't know yet what to put in here (???)
    }
  }

class Rectangle : Figures //class Rectangle is inherited from class Figures
{
    this(double height, double width) //it has its parameters
    {
        //pass in all these into the super class and have it process everything for us
    	super(height, width);
    }

    override double countSquare(double height, double width) //to override method
    {
    	double square = height*width; //formula to count square of rectangle
    	return square;
    }
    override void draw() //now we have to draw a rectangle using the parameters from above
    {
        for(int i=0; i<height; i++)
        {
            for(int j=0; j<width; j++)
            {
                write("*");
            }
            writeln();
        }
    }
}

class Sq : Figures //Sq stands for "square"
{
  this(double height, double width)
    {
    	super(height, width); //do we actually need both??
    }

  override double countSquare(double height, double width)
    {
    double square = height*width; //technically we need just one parameter, S=A^2
    return square;
    }

    override void draw() //height = width, but the method itself is pretty much the same
    {
        for(int i=0; i<height; i++)
        {
            for(int j=0; j<width; j++)
            {
                write("*");
            }
            writeln();
        }
    }
}

class Triangle : Figures
{
    this(double height, double width)
    {
   	   super(height, width); //right triangle
    }

    override double countSquare(double height, double width)
    {
        double square = height*width/2; //S = 0.5AH
        return square;
    }

    override void draw() //this has to draw a left-alligned triangle
    {
        for(int i=0; i<height; i++)
        {
            for(int j=0; j<=i; j++)
            {
                write("*");
            }
            writeln();
        }
    }
}

class Frame : Figures //frame is a rectangle without insides
{
    this(double height, double width)
    {
        super(height, width);
    }

    override double countSquare(double height, double width)
    {
        double square = height*width; //same as in rectangle
        return square;
    }

    override void draw()
    {
        for(int i=0; i<width; i++) //upper border
        {
            write("*");
        }
        for(int i=0; i<height-2; i++) //left and right borders
        {
            for(int j=0; j<width; j++)
            {
                if (j == 0 || j == width - 1)
                {
                    write("*");
                }
                else 
                {
                    write(" ");
                }
            }
        }
        for(int i=0; i<width; i++) //lower border
        {
            write("*");
        }
    }
}


void main()
{
    Figure[] figures;
    while(true)
    {
        string type;
        write("Enter type: ");
        readf("%s\n", type);
        if (type == "rectangle")
        {
            auto rectangle = new Rectangle;
            rectangle.inputWidth();
            rectangle.inputHeight();
            figures ~= rectangle;
        }
        else if (type == "sq")
        {
            auto sq = new Sq;
            sq.inputWidth();
            sq.inputHeight();
            figures ~= sq;
        }
        else if (type == "triangle")
        {
            auto triangle = new Triangle;
            triangle.inputWidth();
            triangle.inputHeight();
            figures ~= triangle;
        }
        else if (type == "frame")
        {
            auto frame = new Frame;
            frame.inputWidth();
            frame.inputHeight();
            figures ~= frame;
        }
        else if (type == "")
        {
            break;
        }
    }

    sort!((a,b) => a.countSquare() < b.countSquare())(figures); //sorting square values in descending order
    foreach (f; figures)
    {
        f.draw();
    }
}
