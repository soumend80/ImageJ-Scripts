input_dir = getDirectory("F:/Soumen/Orbital Shaker/Raw Data/Pressure measurement/2205 balls/Images/");
list = getFileList(input_dir);
for (i=0; i<list.length; i++) {
	if(indexOf(list[i], "Jul17")!=-1){
		//print("True");
		stack1 = input_dir + list[i] + "Extracted images/";
		//print((i+1) + ": " + input_dir + list[i]);
		print((i+1) + ": " + stack1);
		run("Image Sequence...", "open=&stack1 sort");
		makeOval(1123, 1223, 370, 370);
		run("Clear Outside", "stack");
		run("Z Project...", "projection=[Standard Deviation]");
		saveAs("PNG", input_dir + list[i] + "STD_Extracted images.png");
		print("File saved : " + input_dir + list[i] + "STD_Extracted images.png");
		close();
		selectWindow(list[i] + "Extracted images");
		close();
  		run("Collect Garbage");
	}
	//else {
  	//print("False");
	//	}
       /* if (endsWith(list[i], "/"))
           listFiles(""+dir+list[i]);
        else */
           //print((count++) + ": " + input + list[i]);
           
     }
