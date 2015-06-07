float x = PI/3.0;
float xval, yval, zval;

int rowCount;
String charac1, charac2, charac3, charac4;
int i = 0;
int k;
Table table;
int row;
String[] arr1, arr2, arr3, arr4;

void setup() {
	size(500,500,OPENGL);

	table = loadTable("status.csv", "header");
	row = table.getRowCount();

	arr1 = new String[row];

	//populate arrays
	for (TableRow row : table.rows()) {
	    charac1 = row.getString("Characteristic");
	    arr1[i] = charac1;

	    i += 1;
	}

	i=0;
	println("row is " + str(row) + "and rowCount is " + str(rowCount));

	arr2 = new String[row];

	for (TableRow row : table.rows()) {
	    charac2 = row.getString("Percent performing unpaid or community service");
	    arr2[i] = charac2;

	    i += 1;

	}

	i=0;

	arr3 = new String[row];

	for (TableRow row : table.rows()) {
	    charac3 = row.getString("At least once a week");
	    arr3[i] = charac3;
	    i += 1;
	}


	i=0;

	arr4 = new String[row];

	for (TableRow row : table.rows()) {
	    charac4 = row.getString("At least once a month, but not weekly");
	    arr4[i] = charac4;
	    i += 1;

	}




 }
  







	

void draw() {
	background(120);
	x+=0.01;

	pushMatrix();
	translate(width/2,height/2);
	rotateY(x);
	stroke(255,0,0);
	line(-300,0,300,0);
	stroke(0,255,0);
	line(0,-300,0,300);
	stroke(0,0,255);
	line(0,-300,-300,0,300,300);

	for (i=0;i<row;i++) {
		float communityService = table.getFloat(i,1);
		float once = table.getFloat(i,2);
		float month = table.getFloat(i,3);
		float xval = map(once,20,35,300,-300);	
		float yval = map(communityService,25,65,-300,300);	
		float zval = map(month,30,45,-300,300);


			pushMatrix();
			noStroke();
			fill(255,0,0,90);
			translate(xval,yval,zval);
			sphere(5);
			popMatrix();



	}






	popMatrix();

}